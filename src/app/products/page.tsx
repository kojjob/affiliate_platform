import Link from 'next/link';

async function getProducts() {
  const res = await fetch(`${process.env.NEXT_PUBLIC_APP_URL}/api/products`, { cache: 'no-store' });
  if (!res.ok) {
    throw new Error('Failed to fetch products');
  }
  return res.json();
}

export default async function ProductsPage() {
  let products = [];
  let error = null;
  try {
    products = await getProducts();
  } catch (e: any) {
    error = e.message;
  }

  return (
    <div className="container mx-auto p-4">
      <div className="flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold">Our Products</h1>
        <Link href="/admin/add-product" className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
          Add New Product (Admin)
        </Link>
      </div>
      {error && <p className="text-red-500">Error loading products: {error}</p>}
      {!error && products.length === 0 && <p>No products found. Try adding some!</p>}
      {!error && products.length > 0 && (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {products.map((product: any) => (
            <div key={product.id} className="border rounded-lg p-4 shadow-lg">
              {product.imageUrl && (
                <img src={product.imageUrl} alt={product.name} className="w-full h-48 object-cover rounded-md mb-4" />
              )}
              <h2 className="text-xl font-semibold mb-2">{product.name}</h2>
              <p className="text-gray-700 mb-2 truncate">{product.description}</p>
              {product.category && (
                <p className="text-sm text-gray-500 mb-2">Category: {product.category}</p>
              )}
              <Link href={`/products/${product.id}`} className="text-blue-500 hover:text-blue-700 font-semibold">
                View Details
              </Link>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

