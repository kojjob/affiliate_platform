import Link from 'next/link';

async function getProduct(id: string) {
  const res = await fetch(`${process.env.NEXT_PUBLIC_APP_URL}/api/products/${id}`, { cache: 'no-store' });
  if (!res.ok) {
    // This will activate the closest `error.js` Error Boundary
    if (res.status === 404) return null; // Handle not found gracefully
    throw new Error('Failed to fetch product');
  }
  return res.json();
}

export default async function ProductDetailPage({ params }: { params: { id: string } }) {
  let product = null;
  let error = null;

  try {
    product = await getProduct(params.id);
  } catch (e: any) {
    error = e.message;
  }

  if (error) {
    return (
      <div className="container mx-auto p-4">
        <p className="text-red-500">Error loading product: {error}</p>
        <Link href="/products" className="text-blue-500 hover:text-blue-700 mt-4 inline-block">
          &larr; Back to Products
        </Link>
      </div>
    );
  }

  if (!product) {
    return (
      <div className="container mx-auto p-4">
        <h1 className="text-2xl font-bold mb-4">Product Not Found</h1>
        <p>The product you are looking for does not exist.</p>
        <Link href="/products" className="text-blue-500 hover:text-blue-700 mt-4 inline-block">
          &larr; Back to Products
        </Link>
      </div>
    );
  }

  return (
    <div className="container mx-auto p-4">
      <Link href="/products" className="text-blue-500 hover:text-blue-700 mb-6 inline-block">
        &larr; Back to Products
      </Link>
      <div className="border rounded-lg p-6 shadow-lg">
        {product.imageUrl && (
          <img src={product.imageUrl} alt={product.name} className="w-full h-96 object-cover rounded-md mb-6" />
        )}
        <h1 className="text-3xl font-bold mb-4">{product.name}</h1>
        {product.category && (
          <p className="text-md text-gray-600 mb-4">Category: {product.category}</p>
        )}
        <p className="text-gray-800 mb-6 whitespace-pre-wrap">{product.description}</p>
        <a 
          href={product.affiliateLink} 
          target="_blank" 
          rel="noopener noreferrer" 
          className="bg-green-500 hover:bg-green-700 text-white font-bold py-3 px-6 rounded text-lg inline-block"
        >
          View Product / Get Deal
        </a>
      </div>
    </div>
  );
}

// API route for individual product (if not already created)
// File: src/app/api/products/[id]/route.ts
// This will be created in a separate step if it doesn't exist.

