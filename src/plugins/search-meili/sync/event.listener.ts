// import { OnEvent } from '@vendure/core';
// import { ProductEvent } from '@vendure/core';
// import { indexProducts } from '../indexer/product.indexer';

// export class MeiliSyncListener {
//   @OnEvent(ProductEvent)
//   async handle(event: ProductEvent) {
//     if (event.type === 'created' || event.type === 'updated') {
//       await indexProducts([event.entity]);
//     }
//   }
// }
