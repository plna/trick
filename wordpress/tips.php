remove_action( 'woocommerce_after_shop_loop_item', 'woocommerce_template_loop_add_to_cart');

remove_action( 'woocommerce_single_product_summary', 'woocommerce_template_single_add_to_cart', 30 );

add_action('admin_head', 'Hide_WooCommerce_Breadcrumb');
function Hide_WooCommerce_Breadcrumb() {
  echo '<style>
    .woocommerce-layout__header {
      display: none;
    }
  </style>';
}