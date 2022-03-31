'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "3fc3f3a52404455a449b5b2948e4da6f",
"assets/assets/audio/CREDITS": "be75187e87ebaa246502186fe26c2b1f",
"assets/assets/audio/food.wav": "a37c37ff6db21c67e2a75a8e3691c2b4",
"assets/assets/audio/music.mp3": "cd95474da687fee5d24db6729707f843",
"assets/assets/audio/music_bothofus.mp3": "a478953bd1c489cb50733a968ea6e3c5",
"assets/assets/audio/sfx/food.mp3": "938be6ed42c09de39698add6a9181f92",
"assets/assets/audio/sfx/friend.wav": "a7bd5386ff04aaaa4adaeb58e2693dcf",
"assets/assets/fonts/ARCADE_I.TTF": "3e1048ebd1c6e4f9752ae0b3cfe1a7fb",
"assets/assets/fonts/VT323-Regular.ttf": "034de38c65e202c1cc838e7d014385fd",
"assets/assets/images/90_strawberrycake.png": "3faa800010ba66d19d72d33d0dd2ac02",
"assets/assets/images/adam_tile.png": "0598fcd89350209a48461f4cbcd1eabc",
"assets/assets/images/alex_tile.png": "741f77bea1d0aafee14bf83bf6d40d4a",
"assets/assets/images/amelia.png": "5141b2e9a9c2c05b20699b422d8a8926",
"assets/assets/images/amelia_tile.png": "0bbcb3b5f0b861af36e728dbd5c0c46a",
"assets/assets/images/apple_pie.png": "e2379b766e7dff3cac703f92dedd3cdf",
"assets/assets/images/background.png": "4ea6521baa8e4a3db14528c94c65f358",
"assets/assets/images/bob_tile.png": "298cb0dd693fe569419cd6e7ccb06296",
"assets/assets/images/cookies.png": "dd66f497ba718a3751e92dbaec9afcec",
"assets/assets/images/Crystal.png": "b7225bb140db41a59e2af8330fa2da58",
"assets/assets/images/george.png": "418223b3274e16eab1cbef644aba7e3e",
"assets/assets/images/george2.png": "0a8845b2f822da4117b7519e7a58a733",
"assets/assets/images/george3.png": "e31c6b48c69ce7dbdcdbda28dd67a17d",
"assets/assets/images/icecream.PNG": "b45863052810dc1a7ec38d0c8830161d",
"assets/assets/images/jam.png": "2b5c12bcfb7679fa9e19d1dcfae80e3e",
"assets/assets/images/japanese_room.PNG": "c23a6a5fdc30a517883e1d69ca88d973",
"assets/assets/images/mossy_cavern.jpg": "5ff157f6b85420a68973ab58d2a3b498",
"assets/assets/images/mossy_cavern2.jpg": "e951b74562033c079661a1a9d728f68f",
"assets/assets/images/museum.PNG": "27d45676325354d95e61c94295b97112",
"assets/assets/images/Serene_Village_16x16.png": "442a346283058f2086a5e5d1b56d1eeb",
"assets/assets/images/strawberrycake.png": "0c5ffe53d08105634acfb1edbcb424d2",
"assets/assets/tiles/cavern.tmx": "98fb3fbe48200d75a55c0d4d8484c806",
"assets/assets/tiles/happy_map.tmx": "24e9d4392c59af6e332ceb9d2ced35a5",
"assets/assets/tiles/map2.tmx": "ae66c7b0053333e2a2397ce3acdec122",
"assets/assets/tiles/map3.tmx": "57fb49cfd1447d9f5e2bafab11bc81c2",
"assets/FontManifest.json": "6c0f90bf61becafbb69f5fa8141c9b1b",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/NOTICES": "e1d92f72d85e2a1836b1a03fb6f0b97e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "99dd15959cf30847726567266faca80b",
"/": "99dd15959cf30847726567266faca80b",
"main.dart.js": "5f7b8e4e83e73d633b28f0c5e01e40bf",
"manifest.json": "bbb1e1e639427e33e9bd220c37d5098b",
"version.json": "d34282f302341e587410f7d171db453b"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
