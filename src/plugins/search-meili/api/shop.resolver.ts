// import { Resolver, Query, Args } from '@nestjs/graphql';
// import { meiliClient } from '../meili.client';

// @Resolver()
// export class ShopSearchResolver {
//   @Query()
//   async searchProducts(
//     @Args('q') q: string,
//     @Args('limit') limit = 20,
//   ) {
//     const index = meiliClient.index('products');

//     const result = await index.search(q, {
//       limit,
//     });

//     return result.hits;
//   }
// }
