// import { meiliClient } from '../meili.client';

// export const PRODUCT_INDEX = 'products';

// export async function indexProducts(products: any[]) {
//   const index = meiliClient.index(PRODUCT_INDEX);

//   await index.updateSearchableAttributes([
//     'name',
//     'description',
//     'sku',
//     'collection',
//   ]);

//   await index.updateFilterableAttributes([
//     'price',
//     'inStock',
//     'collectionId',
//   ]);

//   await index.addDocuments(products, { primaryKey: 'id' });
// }
