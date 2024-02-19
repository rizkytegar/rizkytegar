import { useEffect, useState } from "react"; 

export default function App() {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  async function GetDataApi() {
    try {
      const response = await fetch("https://api.github.com/users/rizkytegar");
      const Result = await response.json();
      setData(Result);
      setLoading(false);
    } catch (error) {
      setLoading(false);
    }
  }
  useEffect(() => {
    GetDataApi();
  });
  if (loading) {
    return (
      <div className="App">
        <h1>Loading...</h1>
      </div>
    );
  }
  return (
    <div className="App">
      <img width={90} height={90} src={data.avatar_url} alt="images" />
      <h1>My Name Is {data.name}</h1>
      <p>I come from {data.location}</p>
      <span>{data.bio}</span>
    </div>
  );
}
