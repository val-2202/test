export const config = {
  matcher: '/',
};

export default async function middleware(request) {
  const ua = (request.headers.get('user-agent') || '').toLowerCase();

  if (ua.includes('roblox')) {
    const res = await fetch(
      'https://raw.githubusercontent.com/wawa2009/Lost-front-script/refs/heads/main/output.lua'
    );
    const script = await res.text();

    return new Response(script, {
      status: 200,
      headers: {
        'Content-Type': 'text/plain; charset=utf-8',
        'Access-Control-Allow-Origin': '*',
        'Cache-Control': 'no-store',
      },
    });
  }

  return;
}
