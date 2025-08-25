import 'package:test/test.dart';
import 'package:wibbo_api/services/query_to_json.dart';

void main() {
  group('queryToJson', () {
    test('should parse Hiboutik real data correctly', () {
      // Query string réelle reçue de Hiboutik
      const String realQuery = 'order_id=34&sale_id=34&unique_order_id=2025-08-1-&shop_id=1&vendor_id=3&customer_id=0&user_id=3&date_time=2025-08-25+11%3A12%3A36&created_at=2025-08-25+11%3A12%3A31&completed_at=2025-08-25+11%3A12%3A36&store_id=1&unique_sale_id=2025-08-1-8&invoice_id=&currency=EUR&total=30.00&billing_address=0&shipping_address=0&payment=SUMUP&without_taxes=0&prices_without_taxes=0&ressource_id=0&points=0&sale_ext_ref=&service_charge=0.00&guests_number=0&takeaway=0&shipping_ref=&customs_duty=0.00&vat_number=&date_z=20250825&sale_key=p2mwe453kjl78snt4dvfmsmqh&quotation=0&sale_misc=&sale_num_fac=&pickup_date=0000-00-00+00%3A00%3A00&nth_closed_store=8&cash_tendered=0.00&account_status=0&completed_at_date=2025-08-25&created_at_date=2025-08-25&completed_at_yyyymmddhhmmss=20250825111236&created_at_date_yyyy=2025&created_at_date_mm=08&created_at_date_dd=25&created_at_date_hh=11&created_at_date_min=12&created_at_date_ss=31&completed_at_date_yyyy=2025&completed_at_date_mm=08&completed_at_date_dd=25&completed_at_date_hh=11&completed_at_date_min=12&completed_at_date_ss=36&date_z_yyyy=2025&date_z_mm=08&date_z_dd=25&pickup_date_yyyy=0000&pickup_date_mm=00&pickup_date_dd=00&pickup_date_hh=00&pickup_date_min=00&pickup_date_ss=00&pickup_date_utc=0000-00-00+00%3A00%3A00&current_date=2025-08-25&current_date_yyyy=2025&current_date_mm=08&current_date_dd=25&line_items%5B0%5D%5Bproduct_id%5D=30&line_items%5B0%5D%5Bproduct_size%5D=0&line_items%5B0%5D%5Bquantity%5D=1&line_items%5B0%5D%5Bproduct_price%5D=30.00&line_items%5B0%5D%5Bproduct_currency%5D=EUR&line_items%5B0%5D%5Bvat%5D=0.08500&line_items%5B0%5D%5Bpackage%5D=0&line_items%5B0%5D%5Bpoints%5D=0&line_items%5B0%5D%5Bdiscount%5D=0.00&line_items%5B0%5D%5Bstock_withdrawal%5D=1&line_items%5B0%5D%5Bcredit_note%5D=0&line_items%5B0%5D%5Bcredit_note_id%5D=0&line_items%5B0%5D%5Bproduct_comments%5D=&line_items%5B0%5D%5Bserial_number%5D=&line_items%5B0%5D%5Bline_item_id_return%5D=0&line_items%5B0%5D%5Bdate_return%5D=0&line_items%5B0%5D%5Bkitchen_pos%5D=1&line_items%5B0%5D%5Bproduct_supply_price%5D=8.00&line_items%5B0%5D%5Bline_item_id%5D=17&line_items%5B0%5D%5Bdetail_commande_id%5D=17&line_items%5B0%5D%5Bitem_unit_net_wo_discount%5D=27.65&line_items%5B0%5D%5Bitem_unit_gross_wo_discount%5D=30.00&line_items%5B0%5D%5Bitem_unit_discount_net%5D=0.00&line_items%5B0%5D%5Bitem_unit_discount_gross%5D=0.00&line_items%5B0%5D%5Bitem_unit_net%5D=27.65&line_items%5B0%5D%5Bitem_unit_tax%5D=2.35&line_items%5B0%5D%5Bitem_unit_gross%5D=30.00&line_items%5B0%5D%5Bitem_discount_net%5D=0.00&line_items%5B0%5D%5Bitem_discount_tax%5D=0.00&line_items%5B0%5D%5Bitem_discount_gross%5D=0.00&line_items%5B0%5D%5Bitem_discount_percentage%5D=0.00&line_items%5B0%5D%5Bitem_total_net%5D=27.65&line_items%5B0%5D%5Bitem_total_gross%5D=30.00&line_items%5B0%5D%5Bitem_total_tax%5D=2.35&line_items%5B0%5D%5Btax_label%5D=8.5%25&line_items%5B0%5D%5Btax_value%5D=8.5&line_items%5B0%5D%5Bproduct_model%5D=Test+nathan+API&line_items%5B0%5D%5Bproduct_model_short%5D=&line_items%5B0%5D%5Bproduct_barcode%5D=2430000000300&line_items%5B0%5D%5Bproduct_brand%5D=0&line_items%5B0%5D%5Bproduct_supplier%5D=0&line_items%5B0%5D%5Bproduct_category%5D=10&line_items%5B0%5D%5Bproduct_size_type%5D=0&line_items%5B0%5D%5Bproduct_package%5D=0&line_items%5B0%5D%5Bproduct_stock_management%5D=0&line_items%5B0%5D%5Bproduct_supplier_reference%5D=&line_items%5B0%5D%5Bproduct_desc%5D=&line_items%5B0%5D%5Bstorage_location%5D=&line_items%5B0%5D%5Bproduct_arch%5D=0&line_items%5B0%5D%5Bproducts_ref_ext%5D=&line_items%5B0%5D%5Bproduct_display_www%5D=0&line_items%5B0%5D%5Baccounting_account%5D=&line_items%5B0%5D%5Bmisc_date%5D=0000-00-00&line_items%5B0%5D%5Bmisc_decimal%5D=0.00&line_items%5B0%5D%5Bmisc_int%5D=0&line_items%5B0%5D%5Bmisc_varchar%5D=&line_items%5B0%5D%5Bmisc_varchar2%5D=&line_items%5B0%5D%5Bmisc_text%5D=&line_items%5B0%5D%5Bmultiple%5D=1&line_items%5B0%5D%5Bcategory_name%5D=A4&line_items%5B0%5D%5Bsize_name%5D=&line_items%5B0%5D%5Btags%5D=&line_items%5B0%5D%5Bmodifiers%5D=&line_items%5B0%5D%5Bmodifiers_conc%5D=&line_items%5B0%5D%5Bstock_available%5D%5B0%5D%5Bwarehouse_id%5D=1&line_items%5B0%5D%5Bstock_available%5D%5B0%5D%5Bstock_available%5D=15&line_items%5B0%5D%5Bstock_available%5D%5B0%5D%5Binventory_alert%5D=0&line_items%5B0%5D%5Bmultiple_quantity%5D=1&line_items%5B0%5D%5Bmultiple_product_price%5D=30&line_items%5B0%5D%5Bitem_discount_percentage_round_0%5D=0&sale_total_net=27.65&sale_total_tax=2.35&sale_total_gross=30.00&sale_total_quantity=1&sale_total_discount_net=0.00&sale_total_discount_tax=0.00&sale_total_discount_gross=0.00&sale_total_net_wo_discount=27.65&sale_total_gross_wo_discount=30.00&taxes%5B0%5D%5Btax_value%5D=0.08500&taxes%5B0%5D%5Btax_value_p%5D=8.5%25&taxes%5B0%5D%5Btax_label%5D=Taux+normal+8.5%25&taxes%5B0%5D%5Btax_accounting_account%5D=&taxes%5B0%5D%5Btotal_net%5D=27.65&taxes%5B0%5D%5Btotal_vat%5D=2.35&taxes%5B0%5D%5Btotal_gross%5D=30.00&taxes%5B0%5D%5Btax_letter_id%5D=A&taxes_conc=8.5%25%3A+2.35&sale_tags=&closed_day=0&payment_accounting_account=&vendor_last_name=CHATEAU&vendor_first_name=NATHAN&warehouse_id=1&store_address%5Bcompany%5D=ZED+WORLD&store_address%5Baddress%5D=63+RUE+DU+G%C3%89N%C3%89RAL+LAMBERT&store_address%5Bzippostal_code%5D=97436&store_address%5Bcity%5D=SAINT+LEU&store_address%5Bcountry%5D=REU&store_address%5Btax_number%5D=FR30942713421&store_address%5Bcompany_number%5D=94271342100017&store_address%5Blegal_status%5D=SARL&store_address%5Bcode_naf%5D=7410Z&store_address%5Bemail%5D=direction%40zed-world.com&store_address%5Bphone%5D=0692+040+140+&store_address%5Biban%5D=FR76+1010+7003+9900+7320+7317+448&sale_conditions=&payment_ext=&eu_vat_code=S&logo_account=https%3A%2F%2Fzedworld.hiboutik.com%2Fimages%2Fproducts%2Flogo-account.png&url_receipt=https%3A%2F%2Fmyrecei.pt%2Ffr%2F148354%2F34%2Fp2mwe453kj&url_qrcode=https%3A%2F%2Fstatic.hiboutik.com%2Fqrcode%2F%3Furl%3Ahttps%253A%252F%252Fmyrecei.pt%252Ffr%252F148354%252F34%252Fp2mwe453kj&hiboutik_version=19.0.2&sale_language=fr';

      final result = queryToJson(realQuery);

      // Vérifications de base
      expect(result, isA<Map<String, dynamic>>());
      expect(result['order_id'], equals(34));
      expect(result['sale_id'], equals(34));
      expect(result['currency'], equals('EUR'));
      expect(result['total'], equals(30.0));
      expect(result['vendor_last_name'], equals('CHATEAU'));
      expect(result['vendor_first_name'], equals('NATHAN'));

      // Vérification des line_items (tableau)
      expect(result['line_items'], isA<List<dynamic>>());
      expect(result['line_items'].length, greaterThan(0));
      
      final firstLineItem = result['line_items'][0] as Map<String, dynamic>;
      expect(firstLineItem['product_id'], equals(30));
      expect(firstLineItem['quantity'], equals(1));
      expect(firstLineItem['product_price'], equals(30.0));
      expect(firstLineItem['product_model'], equals('Test nathan API'));
      expect(firstLineItem['product_barcode'], equals('2430000000300'));

      // Vérification des taxes (tableau)
      expect(result['taxes'], isA<List<dynamic>>());
      expect(result['taxes'].length, greaterThan(0));
      
      final firstTax = result['taxes'][0] as Map<String, dynamic>;
      expect(firstTax['tax_value'], equals(0.085));
      expect(firstTax['tax_label'], equals('Taux normal 8.5%'));

      // Vérification de store_address (objet imbriqué)
      expect(result['store_address'], isA<Map<String, dynamic>>());
      final storeAddress = result['store_address'] as Map<String, dynamic>;
      expect(storeAddress['company'], equals('ZED WORLD'));
      expect(storeAddress['city'], equals('SAINT LEU'));
      expect(storeAddress['country'], equals('REU'));

      // Debug: afficher la structure de stock_available
      print('✅ Test réussi ! Query parsée correctement');
      print('Nombre total de champs parsés: ${result.length}');
      print('Nombre de line_items: ${result['line_items'].length}');
      print('Nombre de taxes: ${result['taxes'].length}');
      
      // Afficher la structure de stock_available pour debug
      final stockAvailable = firstLineItem['stock_available'];
      print('Type de stock_available: ${stockAvailable.runtimeType}');
      print('Contenu de stock_available: $stockAvailable');
    });
  });
}
