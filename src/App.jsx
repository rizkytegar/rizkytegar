import { useEffect, useState } from "react";

export default function App() {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);

  async function GetDataApi() {
    try {
      const response = await fetch("https://api.github.com/users/rizkytegar");
      const result = await response.json();
      setData(result);
      setLoading(false);
    } catch (error) {
      console.error("Error fetching data:", error);
      setLoading(false);
    }
  }

  useEffect(() => {
    GetDataApi();
  }, []);

  if (loading) {
    return (
      <div className="App">
        <h1>Loading...</h1>
      </div>
    );
  }

  return (
    <div className="App container mx-auto flex justify-center bg-gray-50 h-auto pb-10">
      <div className="max-w-sm overflow-hidden bg-white mt-10 shadow-2xl rounded-md">
        <img
          className="mx-auto mt-4 w-40 h-40 rounded-full"
          src={data.avatar_url}
          alt="images"
        />
        <div className="px-6 py-4">
          <div className="font-bold text-2xl text-center">{data.name}</div>
          <div className="grid gap-4 grid-cols-2 text-center px-5 py-5">
            <div className="bg-blue-800 text-white font-bold py-2 px-4 rounded">
              <p className="font-bold text-2xl">{data.followers}</p>
              <p className="font-base">Followers</p>
            </div>
            <div className="bg-blue-800 text-white font-bold py-2 px-4 rounded">
              <p className="font-bold text-2xl">{data.following}</p>
              <p className="font-base">Following</p>
            </div>
          </div>
          <div className="py-2 text-gray-500 text-base text-md">{data.bio}</div>
          <a
            href={data.html_url}
            target="_blank" 
          >
            <button className="mt-3 mb-5 bg-gray-700 hover:bg-gray-900 text-white font-bold py-2 px-4 rounded">Github</button>
          </a>
        </div>
      </div>
    </div>
  );
}
