// ignore_for_file: public_member_api_docs

class HiboutikSale {
  HiboutikSale({
    required this.saleId,
    required this.createdAt,
    required this.completedAt,
    required this.storeId,
    required this.vendorId,
    required this.uniqueSaleId,
    required this.invoiceId,
    required this.customerId,
    required this.currency,
    required this.total,
    required this.billingAddress,
    required this.shippingAddress,
    required this.payment,
    required this.withoutTaxes,
    required this.pricesWithoutTaxes,
    required this.ressourceId,
    required this.points,
    required this.saleExtRef,
    required this.serviceCharge,
    required this.guestsNumber,
    required this.takeaway,
    required this.shippingRef,
    required this.customsDuty,
    required this.vatNumber,
    required this.dateZ,
    required this.saleKey,
    required this.quotation,
    required this.saleMisc,
    required this.saleNumFac,
    required this.pickupDate,
    required this.nthClosedStore,
    required this.cashTendered,
    required this.accountStatus,
    required this.completedAtDate,
    required this.createdAtDate,
    required this.completedAtYyyymmddhhmmss,
    required this.createdAtDateYyyy,
    required this.createdAtDateMm,
    required this.createdAtDateDd,
    required this.createdAtDateHh,
    required this.createdAtDateMin,
    required this.createdAtDateSs,
    required this.completedAtDateYyyy,
    required this.completedAtDateMm,
    required this.completedAtDateDd,
    required this.completedAtDateHh,
    required this.completedAtDateMin,
    required this.completedAtDateSs,
    required this.dateZYyyy,
    required this.dateZMm,
    required this.dateZDd,
    required this.pickupDateYyyy,
    required this.pickupDateMm,
    required this.pickupDateDd,
    required this.pickupDateHh,
    required this.pickupDateMin,
    required this.pickupDateSs,
    required this.pickupDateUtc,
    required this.currentDate,
    required this.currentDateYyyy,
    required this.currentDateMm,
    required this.currentDateDd,
    required this.lineItems,
    required this.saleTotalNet,
    required this.saleTotalTax,
    required this.saleTotalGross,
    required this.saleTotalQuantity,
    required this.saleTotalDiscountNet,
    required this.saleTotalDiscountTax,
    required this.saleTotalDiscountGross,
    required this.saleTotalNetWoDiscount,
    required this.saleTotalGrossWoDiscount,
    required this.taxes,
    required this.taxesConc,
    required this.saleTags,
    required this.closedDay,
    required this.paymentAccountingAccount,
    required this.vendorLastName,
    required this.vendorFirstName,
    required this.warehouseId,
    required this.storeAddress,
    required this.saleConditions,
    required this.paymentExt,
    required this.euVatCode,
    required this.logoAccount,
    required this.urlReceipt,
    required this.urlQrcode,
    required this.hiboutikVersion,
    required this.saleLanguage,
  });

  factory HiboutikSale.fromJson(Map<String, dynamic> json) {
    try {
      final sale = HiboutikSale(
        saleId: (json['sale_id'] as int?) ?? 0,
        createdAt: (json['created_at'] as String?) ?? '',
        completedAt: (json['completed_at'] as String?) ?? '',
        storeId: (json['store_id'] as int?) ?? 0,
        vendorId: (json['vendor_id'] as int?) ?? 0,
        uniqueSaleId: (json['unique_sale_id'] as String?) ?? '',
        invoiceId: (json['invoice_id'] as String?) ?? '',
        customerId: (json['customer_id'] as int?) ?? 0,
        currency: (json['currency'] as String?) ?? '',
        total: (json['total'] as String?) ?? '',
        billingAddress: (json['billing_address'] as int?) ?? 0,
        shippingAddress: (json['shipping_address'] as int?) ?? 0,
        payment: (json['payment'] as String?) ?? '',
        withoutTaxes: (json['without_taxes'] as int?) ?? 0,
        pricesWithoutTaxes: (json['prices_without_taxes'] as int?) ?? 0,
        ressourceId: (json['ressource_id'] as int?) ?? 0,
        points: (json['points'] as int?) ?? 0,
        saleExtRef: (json['sale_ext_ref'] as String?) ?? '',
        serviceCharge: (json['service_charge'] as String?) ?? '',
        guestsNumber: (json['guests_number'] as int?) ?? 0,
        takeaway: (json['takeaway'] as int?) ?? 0,
        shippingRef: (json['shipping_ref'] as String?) ?? '',
        customsDuty: (json['customs_duty'] as String?) ?? '',
        vatNumber: (json['vat_number'] as String?) ?? '',
        dateZ: (json['date_z'] as int?) ?? 0,
        saleKey: (json['sale_key'] as String?) ?? '',
        quotation: (json['quotation'] as int?) ?? 0,
        saleMisc: json['sale_misc'],
        saleNumFac: (json['sale_num_fac'] as String?) ?? '',
        pickupDate: (json['pickup_date'] as String?) ?? '',
        nthClosedStore: (json['nth_closed_store'] as int?) ?? 0,
        cashTendered: (json['cash_tendered'] as String?) ?? '',
        accountStatus: (json['account_status'] as int?) ?? 0,
        completedAtDate: (json['completed_at_date'] as String?) ?? '',
        createdAtDate: (json['created_at_date'] as String?) ?? '',
        completedAtYyyymmddhhmmss:
            (json['completed_at_yyyymmddhhmmss'] as String?) ?? '',
        createdAtDateYyyy: (json['created_at_date_yyyy'] as String?) ?? '',
        createdAtDateMm: (json['created_at_date_mm'] as String?) ?? '',
        createdAtDateDd: (json['created_at_date_dd'] as String?) ?? '',
        createdAtDateHh: (json['created_at_date_hh'] as String?) ?? '',
        createdAtDateMin: (json['created_at_date_min'] as String?) ?? '',
        createdAtDateSs: (json['created_at_date_ss'] as String?) ?? '',
        completedAtDateYyyy: (json['completed_at_date_yyyy'] as String?) ?? '',
        completedAtDateMm: (json['completed_at_date_mm'] as String?) ?? '',
        completedAtDateDd: (json['completed_at_date_dd'] as String?) ?? '',
        completedAtDateHh: (json['completed_at_date_hh'] as String?) ?? '',
        completedAtDateMin: (json['completed_at_date_min'] as String?) ?? '',
        completedAtDateSs: (json['completed_at_date_ss'] as String?) ?? '',
        dateZYyyy: (json['date_z_yyyy'] as String?) ?? '',
        dateZMm: (json['date_z_mm'] as bool?) ?? false,
        dateZDd: (json['date_z_dd'] as bool?) ?? false,
        pickupDateYyyy: (json['pickup_date_yyyy'] as String?) ?? '',
        pickupDateMm: (json['pickup_date_mm'] as String?) ?? '',
        pickupDateDd: (json['pickup_date_dd'] as String?) ?? '',
        pickupDateHh: (json['pickup_date_hh'] as String?) ?? '',
        pickupDateMin: (json['pickup_date_min'] as String?) ?? '',
        pickupDateSs: (json['pickup_date_ss'] as String?) ?? '',
        pickupDateUtc: (json['pickup_date_utc'] as String?) ?? '',
        currentDate: (json['current_date'] as String?) ?? '',
        currentDateYyyy: (json['current_date_yyyy'] as String?) ?? '',
        currentDateMm: (json['current_date_mm'] as String?) ?? '',
        currentDateDd: (json['current_date_dd'] as String?) ?? '',
        lineItems: (json['line_items'] as List<dynamic>?)
                ?.map((item) => LineItem.fromJson(item as Map<String, dynamic>))
                .toList() ??
            [],
        saleTotalNet: (json['sale_total_net'] as String?) ?? '',
        saleTotalTax: (json['sale_total_tax'] as String?) ?? '',
        saleTotalGross: (json['sale_total_gross'] as String?) ?? '',
        saleTotalQuantity: (json['sale_total_quantity'] as int?) ?? 0,
        saleTotalDiscountNet:
            (json['sale_total_discount_net'] as String?) ?? '',
        saleTotalDiscountTax:
            (json['sale_total_discount_tax'] as String?) ?? '',
        saleTotalDiscountGross:
            (json['sale_total_discount_gross'] as String?) ?? '',
        saleTotalNetWoDiscount:
            (json['sale_total_net_wo_discount'] as String?) ?? '',
        saleTotalGrossWoDiscount:
            (json['sale_total_gross_wo_discount'] as String?) ?? '',
        taxes: (json['taxes'] as List<dynamic>?)
                ?.map((tax) => Tax.fromJson(tax as Map<String, dynamic>))
                .toList() ??
            [],
        taxesConc: (json['taxes_conc'] as String?) ?? '',
        saleTags: (json['sale_tags'] as List<dynamic>?) ?? [],
        closedDay: (json['closed_day'] as int?) ?? 0,
        paymentAccountingAccount:
            (json['payment_accounting_account'] as String?) ?? '',
        vendorLastName: (json['vendor_last_name'] as String?) ?? '',
        vendorFirstName: (json['vendor_first_name'] as String?) ?? '',
        warehouseId: (json['warehouse_id'] as int?) ?? 0,
        storeAddress: StoreAddress.fromJson(
            json['store_address'] as Map<String, dynamic>),
        saleConditions: (json['sale_conditions'] as String?) ?? '',
        paymentExt: (json['payment_ext'] as List<dynamic>?) ?? [],
        euVatCode: (json['eu_vat_code'] as String?) ?? '',
        logoAccount: (json['logo_account'] as String?) ?? '',
        urlReceipt: (json['url_receipt'] as String?) ?? '',
        urlQrcode: (json['url_qrcode'] as String?) ?? '',
        hiboutikVersion: (json['hiboutik_version'] as String?) ?? '',
        saleLanguage: (json['sale_language'] as String?) ?? '',
      );
      return sale;
    } catch (e) {
      throw Exception('Erreur lors de la conversion de la vente: $e');
    }
  }
  final int saleId;
  final String createdAt;
  final String completedAt;
  final int storeId;
  final int vendorId;
  final String uniqueSaleId;
  final String invoiceId;
  final int customerId;
  final String currency;
  final String total;
  final int billingAddress;
  final int shippingAddress;
  final String payment;
  final int withoutTaxes;
  final int pricesWithoutTaxes;
  final int ressourceId;
  final int points;
  final String saleExtRef;
  final String serviceCharge;
  final int guestsNumber;
  final int takeaway;
  final String shippingRef;
  final String customsDuty;
  final String vatNumber;
  final int dateZ;
  final String saleKey;
  final int quotation;
  final dynamic saleMisc;
  final String saleNumFac;
  final String pickupDate;
  final int nthClosedStore;
  final String cashTendered;
  final int accountStatus;
  final String completedAtDate;
  final String createdAtDate;
  final String completedAtYyyymmddhhmmss;
  final String createdAtDateYyyy;
  final String createdAtDateMm;
  final String createdAtDateDd;
  final String createdAtDateHh;
  final String createdAtDateMin;
  final String createdAtDateSs;
  final String completedAtDateYyyy;
  final String completedAtDateMm;
  final String completedAtDateDd;
  final String completedAtDateHh;
  final String completedAtDateMin;
  final String completedAtDateSs;
  final String dateZYyyy;
  final bool dateZMm;
  final bool dateZDd;
  final String pickupDateYyyy;
  final String pickupDateMm;
  final String pickupDateDd;
  final String pickupDateHh;
  final String pickupDateMin;
  final String pickupDateSs;
  final String pickupDateUtc;
  final String currentDate;
  final String currentDateYyyy;
  final String currentDateMm;
  final String currentDateDd;
  final List<LineItem> lineItems;
  final String saleTotalNet;
  final String saleTotalTax;
  final String saleTotalGross;
  final int saleTotalQuantity;
  final String saleTotalDiscountNet;
  final String saleTotalDiscountTax;
  final String saleTotalDiscountGross;
  final String saleTotalNetWoDiscount;
  final String saleTotalGrossWoDiscount;
  final List<Tax> taxes;
  final String taxesConc;
  final List<dynamic> saleTags;
  final int closedDay;
  final String paymentAccountingAccount;
  final String vendorLastName;
  final String vendorFirstName;
  final int warehouseId;
  final StoreAddress storeAddress;
  final String saleConditions;
  final List<dynamic> paymentExt;
  final String euVatCode;
  final String logoAccount;
  final String urlReceipt;
  final String urlQrcode;
  final String hiboutikVersion;
  final String saleLanguage;

  Map<String, dynamic> toJson() {
    return {
      'sale_id': saleId,
      'created_at': createdAt,
      'completed_at': completedAt,
      'store_id': storeId,
      'vendor_id': vendorId,
      'unique_sale_id': uniqueSaleId,
      'invoice_id': invoiceId,
      'customer_id': customerId,
      'currency': currency,
      'total': total,
      'billing_address': billingAddress,
      'shipping_address': shippingAddress,
      'payment': payment,
      'without_taxes': withoutTaxes,
      'prices_without_taxes': pricesWithoutTaxes,
      'ressource_id': ressourceId,
      'points': points,
      'sale_ext_ref': saleExtRef,
      'service_charge': serviceCharge,
      'guests_number': guestsNumber,
      'takeaway': takeaway,
      'shipping_ref': shippingRef,
      'customs_duty': customsDuty,
      'vat_number': vatNumber,
      'date_z': dateZ,
      'sale_key': saleKey,
      'quotation': quotation,
      'sale_misc': saleMisc,
      'sale_num_fac': saleNumFac,
      'pickup_date': pickupDate,
      'nth_closed_store': nthClosedStore,
      'cash_tendered': cashTendered,
      'account_status': accountStatus,
      'completed_at_date': completedAtDate,
      'created_at_date': createdAtDate,
      'completed_at_yyyymmddhhmmss': completedAtYyyymmddhhmmss,
      'created_at_date_yyyy': createdAtDateYyyy,
      'created_at_date_mm': createdAtDateMm,
      'created_at_date_dd': createdAtDateDd,
      'created_at_date_hh': createdAtDateHh,
      'created_at_date_min': createdAtDateMin,
      'created_at_date_ss': createdAtDateSs,
      'completed_at_date_yyyy': completedAtDateYyyy,
      'completed_at_date_mm': completedAtDateMm,
      'completed_at_date_dd': completedAtDateDd,
      'completed_at_date_hh': completedAtDateHh,
      'completed_at_date_min': completedAtDateMin,
      'completed_at_date_ss': completedAtDateSs,
      'date_z_yyyy': dateZYyyy,
      'date_z_mm': dateZMm,
      'date_z_dd': dateZDd,
      'pickup_date_yyyy': pickupDateYyyy,
      'pickup_date_mm': pickupDateMm,
      'pickup_date_dd': pickupDateDd,
      'pickup_date_hh': pickupDateHh,
      'pickup_date_min': pickupDateMin,
      'pickup_date_ss': pickupDateSs,
      'pickup_date_utc': pickupDateUtc,
      'current_date': currentDate,
      'current_date_yyyy': currentDateYyyy,
      'current_date_mm': currentDateMm,
      'current_date_dd': currentDateDd,
      'line_items': lineItems.map((item) => item.toJson()).toList(),
      'sale_total_net': saleTotalNet,
      'sale_total_tax': saleTotalTax,
      'sale_total_gross': saleTotalGross,
      'sale_total_quantity': saleTotalQuantity,
      'sale_total_discount_net': saleTotalDiscountNet,
      'sale_total_discount_tax': saleTotalDiscountTax,
      'sale_total_discount_gross': saleTotalDiscountGross,
      'sale_total_net_wo_discount': saleTotalNetWoDiscount,
      'sale_total_gross_wo_discount': saleTotalGrossWoDiscount,
      'taxes': taxes.map((tax) => tax.toJson()).toList(),
      'taxes_conc': taxesConc,
      'sale_tags': saleTags,
      'closed_day': closedDay,
      'payment_accounting_account': paymentAccountingAccount,
      'vendor_last_name': vendorLastName,
      'vendor_first_name': vendorFirstName,
      'warehouse_id': warehouseId,
      'store_address': storeAddress.toJson(),
      'sale_conditions': saleConditions,
      'payment_ext': paymentExt,
      'eu_vat_code': euVatCode,
      'logo_account': logoAccount,
      'url_receipt': urlReceipt,
      'url_qrcode': urlQrcode,
      'hiboutik_version': hiboutikVersion,
      'sale_language': saleLanguage,
    };
  }
}

class LineItem {
  final int productId;
  final int productSize;
  final int quantity;
  final String productPrice;
  final String productCurrency;
  final String vat;
  final int package;
  final int points;
  final String discount;
  final int stockWithdrawal;
  final int creditNote;
  final int creditNoteId;
  final String productComments;
  final String serialNumber;
  final int lineItemIdReturn;
  final int dateReturn;
  final int kitchenPos;
  final String productSupplyPrice;
  final int lineItemId;
  final int detailCommandeId;
  final String itemUnitNetWoDiscount;
  final String itemUnitGrossWoDiscount;
  final String itemUnitDiscountNet;
  final String itemUnitDiscountGross;
  final String itemUnitNet;
  final String itemUnitTax;
  final String itemUnitGross;
  final String itemDiscountNet;
  final String itemDiscountTax;
  final String itemDiscountGross;
  final String itemDiscountPercentage;
  final String itemTotalNet;
  final String itemTotalGross;
  final String itemTotalTax;
  final String taxLabel;
  final double taxValue;
  final String productModel;
  final String productModelShort;
  final String productBarcode;
  final int productBrand;
  final int productSupplier;
  final int productCategory;
  final int productSizeType;
  final int productPackage;
  final int productStockManagement;
  final String productSupplierReference;
  final String productDesc;
  final String storageLocation;
  final int productArch;
  final String productsRefExt;
  final int productDisplayWww;
  final String accountingAccount;
  final String miscDate;
  final String miscDecimal;
  final int miscInt;
  final String miscVarchar;
  final String miscVarchar2;
  final String miscText;
  final int multiple;
  final String categoryName;
  final String sizeName;
  final List<dynamic> tags;
  final List<dynamic> modifiers;
  final String modifiersConc;
  final int multipleQuantity;
  final int multipleProductPrice;
  final String itemDiscountPercentageRound0;

  LineItem({
    required this.productId,
    required this.productSize,
    required this.quantity,
    required this.productPrice,
    required this.productCurrency,
    required this.vat,
    required this.package,
    required this.points,
    required this.discount,
    required this.stockWithdrawal,
    required this.creditNote,
    required this.creditNoteId,
    required this.productComments,
    required this.serialNumber,
    required this.lineItemIdReturn,
    required this.dateReturn,
    required this.kitchenPos,
    required this.productSupplyPrice,
    required this.lineItemId,
    required this.detailCommandeId,
    required this.itemUnitNetWoDiscount,
    required this.itemUnitGrossWoDiscount,
    required this.itemUnitDiscountNet,
    required this.itemUnitDiscountGross,
    required this.itemUnitNet,
    required this.itemUnitTax,
    required this.itemUnitGross,
    required this.itemDiscountNet,
    required this.itemDiscountTax,
    required this.itemDiscountGross,
    required this.itemDiscountPercentage,
    required this.itemTotalNet,
    required this.itemTotalGross,
    required this.itemTotalTax,
    required this.taxLabel,
    required this.taxValue,
    required this.productModel,
    required this.productModelShort,
    required this.productBarcode,
    required this.productBrand,
    required this.productSupplier,
    required this.productCategory,
    required this.productSizeType,
    required this.productPackage,
    required this.productStockManagement,
    required this.productSupplierReference,
    required this.productDesc,
    required this.storageLocation,
    required this.productArch,
    required this.productsRefExt,
    required this.productDisplayWww,
    required this.accountingAccount,
    required this.miscDate,
    required this.miscDecimal,
    required this.miscInt,
    required this.miscVarchar,
    required this.miscVarchar2,
    required this.miscText,
    required this.multiple,
    required this.categoryName,
    required this.sizeName,
    required this.tags,
    required this.modifiers,
    required this.modifiersConc,
    required this.multipleQuantity,
    required this.multipleProductPrice,
    required this.itemDiscountPercentageRound0,
  });

  factory LineItem.fromJson(Map<String, dynamic> json) {
    return LineItem(
      productId: (json['product_id'] as int?) ?? 0,
      productSize: (json['product_size'] as int?) ?? 0,
      quantity: (json['quantity'] as int?) ?? 0,
      productPrice: (json['product_price'] as String?) ?? '',
      productCurrency: (json['product_currency'] as String?) ?? '',
      vat: (json['vat'] as String?) ?? '',
      package: (json['package'] as int?) ?? 0,
      points: (json['points'] as int?) ?? 0,
      discount: (json['discount'] as String?) ?? '',
      stockWithdrawal: (json['stock_withdrawal'] as int?) ?? 0,
      creditNote: (json['credit_note'] as int?) ?? 0,
      creditNoteId: (json['credit_note_id'] as int?) ?? 0,
      productComments: (json['product_comments'] as String?) ?? '',
      serialNumber: (json['serial_number'] as String?) ?? '',
      lineItemIdReturn: (json['line_item_id_return'] as int?) ?? 0,
      dateReturn: (json['date_return'] as int?) ?? 0,
      kitchenPos: (json['kitchen_pos'] as int?) ?? 0,
      productSupplyPrice: (json['product_supply_price'] as String?) ?? '',
      lineItemId: (json['line_item_id'] as int?) ?? 0,
      detailCommandeId: (json['detail_commande_id'] as int?) ?? 0,
      itemUnitNetWoDiscount:
          (json['item_unit_net_wo_discount'] as String?) ?? '',
      itemUnitGrossWoDiscount:
          (json['item_unit_gross_wo_discount'] as String?) ?? '',
      itemUnitDiscountNet: (json['item_unit_discount_net'] as String?) ?? '',
      itemUnitDiscountGross:
          (json['item_unit_discount_gross'] as String?) ?? '',
      itemUnitNet: (json['item_unit_net'] as String?) ?? '',
      itemUnitTax: (json['item_unit_tax'] as String?) ?? '',
      itemUnitGross: (json['item_unit_gross'] as String?) ?? '',
      itemDiscountNet: (json['item_discount_net'] as String?) ?? '',
      itemDiscountTax: (json['item_discount_tax'] as String?) ?? '',
      itemDiscountGross: (json['item_discount_gross'] as String?) ?? '',
      itemDiscountPercentage:
          (json['item_discount_percentage'] as String?) ?? '',
      itemTotalNet: (json['item_total_net'] as String?) ?? '',
      itemTotalGross: (json['item_total_gross'] as String?) ?? '',
      itemTotalTax: (json['item_total_tax'] as String?) ?? '',
      taxLabel: (json['tax_label'] as String?) ?? '',
      taxValue: (json['tax_value'] as double?) ?? 0,
      productModel: (json['product_model'] as String?) ?? '',
      productModelShort: (json['product_model_short'] as String?) ?? '',
      productBarcode: (json['product_barcode'] as String?) ?? '',
      productBrand: (json['product_brand'] as int?) ?? 0,
      productSupplier: (json['product_supplier'] as int?) ?? 0,
      productCategory: (json['product_category'] as int?) ?? 0,
      productSizeType: (json['product_size_type'] as int?) ?? 0,
      productPackage: (json['product_package'] as int?) ?? 0,
      productStockManagement: (json['product_stock_management'] as int?) ?? 0,
      productSupplierReference:
          (json['product_supplier_reference'] as String?) ?? '',
      productDesc: (json['product_desc'] as String?) ?? '',
      storageLocation: (json['storage_location'] as String?) ?? '',
      productArch: (json['product_arch'] as int?) ?? 0,
      productsRefExt: (json['products_ref_ext'] as String?) ?? '',
      productDisplayWww: (json['product_display_www'] as int?) ?? 0,
      accountingAccount: (json['accounting_account'] as String?) ?? '',
      miscDate: (json['misc_date'] as String?) ?? '',
      miscDecimal: (json['misc_decimal'] as String?) ?? '',
      miscInt: (json['misc_int'] as int?) ?? 0,
      miscVarchar: (json['misc_varchar'] as String?) ?? '',
      miscVarchar2: (json['misc_varchar2'] as String?) ?? '',
      miscText: (json['misc_text'] as String?) ?? '',
      multiple: (json['multiple'] as int?) ?? 0,
      categoryName: (json['category_name'] as String?) ?? '',
      sizeName: (json['size_name'] as String?) ?? '',
      tags: (json['tags'] as List<dynamic>?) ?? [],
      modifiers: (json['modifiers'] as List<dynamic>?) ?? [],
      modifiersConc: (json['modifiers_conc'] as String?) ?? '',
      multipleQuantity: (json['multiple_quantity'] as int?) ?? 0,
      multipleProductPrice: (json['multiple_product_price'] as int?) ?? 0,
      itemDiscountPercentageRound0:
          (json['item_discount_percentage_round_0'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'product_size': productSize,
      'quantity': quantity,
      'product_price': productPrice,
      'product_currency': productCurrency,
      'vat': vat,
      'package': package,
      'points': points,
      'discount': discount,
      'stock_withdrawal': stockWithdrawal,
      'credit_note': creditNote,
      'credit_note_id': creditNoteId,
      'product_comments': productComments,
      'serial_number': serialNumber,
      'line_item_id_return': lineItemIdReturn,
      'date_return': dateReturn,
      'kitchen_pos': kitchenPos,
      'product_supply_price': productSupplyPrice,
      'line_item_id': lineItemId,
      'detail_commande_id': detailCommandeId,
      'item_unit_net_wo_discount': itemUnitNetWoDiscount,
      'item_unit_gross_wo_discount': itemUnitGrossWoDiscount,
      'item_unit_discount_net': itemUnitDiscountNet,
      'item_unit_discount_gross': itemUnitDiscountGross,
      'item_unit_net': itemUnitNet,
      'item_unit_tax': itemUnitTax,
      'item_unit_gross': itemUnitGross,
      'item_discount_net': itemDiscountNet,
      'item_discount_tax': itemDiscountTax,
      'item_discount_gross': itemDiscountGross,
      'item_discount_percentage': itemDiscountPercentage,
      'item_total_net': itemTotalNet,
      'item_total_gross': itemTotalGross,
      'item_total_tax': itemTotalTax,
      'tax_label': taxLabel,
      'tax_value': taxValue,
      'product_model': productModel,
      'product_model_short': productModelShort,
      'product_barcode': productBarcode,
      'product_brand': productBrand,
      'product_supplier': productSupplier,
      'product_category': productCategory,
      'product_size_type': productSizeType,
      'product_package': productPackage,
      'product_stock_management': productStockManagement,
      'product_supplier_reference': productSupplierReference,
      'product_desc': productDesc,
      'storage_location': storageLocation,
      'product_arch': productArch,
      'products_ref_ext': productsRefExt,
      'product_display_www': productDisplayWww,
      'accounting_account': accountingAccount,
      'misc_date': miscDate,
      'misc_decimal': miscDecimal,
      'misc_int': miscInt,
      'misc_varchar': miscVarchar,
      'misc_varchar2': miscVarchar2,
      'misc_text': miscText,
      'multiple': multiple,
      'category_name': categoryName,
      'size_name': sizeName,
      'tags': tags,
      'modifiers': modifiers,
      'modifiers_conc': modifiersConc,
      'multiple_quantity': multipleQuantity,
      'multiple_product_price': multipleProductPrice,
      'item_discount_percentage_round_0': itemDiscountPercentageRound0,
    };
  }
}

class Tax {
  Tax({
    required this.taxValue,
    required this.taxValueP,
    required this.taxLabel,
    required this.taxAccountingAccount,
    required this.totalNet,
    required this.totalVat,
    required this.totalGross,
    required this.taxLetterId,
  });

  factory Tax.fromJson(Map<String, dynamic> json) {
    return Tax(
      taxValue: (json['tax_value'] as String?) ?? '',
      taxValueP: (json['tax_value_p'] as String?) ?? '',
      taxLabel: (json['tax_label'] as String?) ?? '',
      taxAccountingAccount: (json['tax_accounting_account'] as String?) ?? '',
      totalNet: (json['total_net'] as String?) ?? '',
      totalVat: (json['total_vat'] as String?) ?? '',
      totalGross: (json['total_gross'] as String?) ?? '',
      taxLetterId: (json['tax_letter_id'] as String?) ?? '',
    );
  }
  final String taxValue;
  final String taxValueP;
  final String taxLabel;
  final String taxAccountingAccount;
  final String totalNet;
  final String totalVat;
  final String totalGross;
  final String taxLetterId;

  Map<String, dynamic> toJson() {
    return {
      'tax_value': taxValue,
      'tax_value_p': taxValueP,
      'tax_label': taxLabel,
      'tax_accounting_account': taxAccountingAccount,
      'total_net': totalNet,
      'total_vat': totalVat,
      'total_gross': totalGross,
      'tax_letter_id': taxLetterId,
    };
  }
}

class StoreAddress {
  final String company;
  final String address;
  final String zippostalCode;
  final String city;
  final String country;
  final String taxNumber;
  final String companyNumber;
  final String legalStatus;
  final String codeNaf;
  final String email;
  final String phone;
  final String iban;

  StoreAddress({
    required this.company,
    required this.address,
    required this.zippostalCode,
    required this.city,
    required this.country,
    required this.taxNumber,
    required this.companyNumber,
    required this.legalStatus,
    required this.codeNaf,
    required this.email,
    required this.phone,
    required this.iban,
  });

  factory StoreAddress.fromJson(Map<String, dynamic> json) {
    return StoreAddress(
      company: (json['company'] as String?) ?? '',
      address: (json['address'] as String?) ?? '',
      zippostalCode: (json['zippostal_code'] as String?) ?? '',
      city: (json['city'] as String?) ?? '',
      country: (json['country'] as String?) ?? '',
      taxNumber: (json['tax_number'] as String?) ?? '',
      companyNumber: (json['company_number'] as String?) ?? '',
      legalStatus: (json['legal_status'] as String?) ?? '',
      codeNaf: (json['code_naf'] as String?) ?? '',
      email: (json['email'] as String?) ?? '',
      phone: (json['phone'] as String?) ?? '',
      iban: (json['iban'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company': company,
      'address': address,
      'zippostal_code': zippostalCode,
      'city': city,
      'country': country,
      'tax_number': taxNumber,
      'company_number': companyNumber,
      'legal_status': legalStatus,
      'code_naf': codeNaf,
      'email': email,
      'phone': phone,
      'iban': iban,
    };
  }
}
