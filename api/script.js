export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Content-Type', 'text/plain; charset=utf-8');

  const response = await fetch(
    'https://raw.githubusercontent.com/wawa2009/Lost-front-script/refs/heads/main/output.lua'
  );
  const script = await response.text();

  res.status(200).send(script);
}
