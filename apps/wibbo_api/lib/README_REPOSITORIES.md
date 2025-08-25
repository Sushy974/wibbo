# Repositories Wix et Hiboutik

Ce document explique comment utiliser les repositories créés pour communiquer avec les APIs Wix et Hiboutik.

## Structure des fichiers

### Modèles
- `models/wix_models.dart` - Modèles pour les entités Wix (produits, commandes, etc.)
- `models/hiboutik_models.dart` - Modèles pour les entités Hiboutik (produits, ventes, clients, etc.)

### Repositories
- `repository/wix_repository.dart` - Repository pour l'API Wix
- `repository/hiboutik_repository.dart` - Repository pour l'API Hiboutik

### Services
- `services/wix_service.dart` - Service pour gérer les opérations Wix
- `services/hiboutik_service.dart` - Service pour gérer les opérations Hiboutik

## Utilisation

### 1. Configuration des dépendances

```dart
import 'package:http/http.dart' as http;
import 'models/models.dart';
import 'repository/repositories.dart';
import 'services/services.dart';

// Créer les instances
final httpClient = http.Client();
final wixRepository = WixApiRepository(httpClient: httpClient);
final hiboutikRepository = HiboutikApiRepository(httpClient: httpClient);

// Créer les services
final wixService = WixService(wixRepository: wixRepository);
final hiboutikService = HiboutikService(hiboutikRepository: hiboutikRepository);
```

### 2. Exemple d'utilisation avec Wix

```dart
// Récupérer tous les produits
final products = await wixService.getProducts(compte: compteUtilisateur);

// Créer un nouveau produit
final newProduct = WixProduct(
  id: '',
  name: 'Nouveau Produit',
  price: 29.99,
  description: 'Description du produit',
  sku: 'PROD-001',
  stockQuantity: 10,
  isVisible: true,
  images: ['https://example.com/image.jpg'],
);

final createdProduct = await wixService.createProduct(
  product: newProduct,
  compte: compteUtilisateur,
);

// Récupérer les commandes
final orders = await wixService.getOrders(compte: compteUtilisateur);

// Mettre à jour le statut d'une commande
final updatedOrder = await wixService.updateOrderStatus(
  orderId: 'order-123',
  status: 'shipped',
  compte: compteUtilisateur,
);
```

### 3. Exemple d'utilisation avec Hiboutik

```dart
// Récupérer tous les produits
final products = await hiboutikService.getProducts(compte: compteUtilisateur);

// Créer un nouveau produit
final newProduct = HiboutikProduct(
  id: '',
  name: 'Nouveau Produit',
  price: 29.99,
  description: 'Description du produit',
  sku: 'PROD-001',
  stockQuantity: 10,
  isActive: true,
  category: 'Électronique',
  images: ['https://example.com/image.jpg'],
);

final createdProduct = await hiboutikService.createProduct(
  product: newProduct,
  compte: compteUtilisateur,
);

// Créer une nouvelle vente
final newSale = HiboutikSale(
  id: '',
  saleNumber: 'SALE-001',
  customerEmail: 'client@example.com',
  totalAmount: 59.98,
  status: 'pending',
  createdDate: DateTime.now(),
  items: [
    HiboutikSaleItem(
      productId: 'prod-123',
      name: 'Produit Test',
      quantity: 2,
      price: 29.99,
      sku: 'PROD-001',
    ),
  ],
  customerName: 'Jean Dupont',
  customerPhone: '0123456789',
);

final createdSale = await hiboutikService.createSale(
  sale: newSale,
  compte: compteUtilisateur,
);
```

### 4. Synchronisation entre plateformes

```dart
// Synchroniser les produits de Wix vers Hiboutik
final wixProducts = await wixService.getProducts(compte: compteUtilisateur);

// Convertir les produits Wix en produits Hiboutik
final hiboutikProducts = wixProducts.map((wixProduct) => HiboutikProduct(
  id: wixProduct.id,
  name: wixProduct.name,
  price: wixProduct.price,
  description: wixProduct.description,
  sku: wixProduct.sku,
  stockQuantity: wixProduct.stockQuantity,
  isActive: wixProduct.isVisible,
  category: '',
  images: wixProduct.images,
)).toList();

// Synchroniser vers Hiboutik
final syncedProducts = await hiboutikService.syncProducts(
  sourceProducts: hiboutikProducts,
  compte: compteUtilisateur,
);
```

### 5. Test de connexion

```dart
// Tester la connexion Wix
final wixConnected = await wixService.testConnection(compte: compteUtilisateur);
print('Wix connecté: $wixConnected');

// Tester la connexion Hiboutik
final hiboutikConnected = await hiboutikService.testConnection(compte: compteUtilisateur);
print('Hiboutik connecté: $hiboutikConnected');
```

## Gestion des erreurs

Tous les repositories gèrent automatiquement les erreurs de connexion et les codes de statut HTTP. Les erreurs sont encapsulées dans des `Exception` avec des messages descriptifs.

```dart
try {
  final products = await wixService.getProducts(compte: compteUtilisateur);
} catch (e) {
  print('Erreur lors de la récupération des produits: $e');
}
```

## Configuration du compte utilisateur

Le modèle `CompteUtilisateur` contient tous les paramètres nécessaires pour la connexion :

- **Wix** : `wixApiKey`, `wixSiteId`, `urlWix`
- **Hiboutik** : `apiKey`, `hiboutikIdVendeur`, `urlHiboutik`

Assurez-vous que ces champs sont correctement remplis avant d'utiliser les repositories.
