Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.177.160.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429078;
	b=GbS1q9KaZ4fmEux9aE51JWJVxMF8lbWj+NeYSnFf9/SFSAySGgnu1YZIdPyMvhmTgNdb
	 tW/CexSyIKJstHSnn0yHUhTQaUDsJ2NN8HrJ4ObANaeb9f+1T2BKNn/hWyMc6t1AAvG5U
	 B5vJQM4lAVzSaY9nJE+QdSFFTO4PUVpXmwnCun3PYdFYokoDW353jPd4iZSWcISDIStXD
	 i6/XTYxZ6GZIYo1XuvOXK3qXDuNnFaE8CbGjGLO8RxhY+poiTvlMf/r9ZswAmhn8lP75g
	 o+uxFm1PQui5CaQffzFKISWjfX79JBIZ436TO8q4arEkNcdU48RhKWzEIVzfTAgpoTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429078;
	h=DMARC-Filter:Received:Received:Received:Received:Received:Received:
	 Date:From:To:CC:Subject:User-Agent:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-CC-Diagnostic;
	bh=StHyQ2d7AcnzznKh2Uvz/szM6IaNt8yRCVDpV+U5dWo=;
	b=iTErkJ0iGlWN1dZXQMOEXF0UJFJ0f9FT/mTSnJwxBYMn2Enwnq8T4aq2FSBcccUYtRFK
	 zaUg3zJwY+rK6r68TTH/5JvNac1jCEuPgZWUcWMUrhbjYICkglzr4NkBorQsax3R4Qsqy
	 MHCeDz8vAufxNlJswmVe7bhxBCQB7Kcs49Pz5D4Udo+yLiq6ggRVE03JXh5+eAo/P5xdn
	 cxSRxiLdDwHcjIN8VFAwhCOiI1fEGNywhUZcze660l+GtxXavxhakmxm9rXEiJNrSOoMD
	 5IfVZC7114CsyJ3E/0ElckJJkaJs+5QMXNG/3YjO+vN+4alW9EmVKzFipeOgWgx/d/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfareas.com;
	spf=pass smtp.mailfrom=rfareas.com;
	arc=none smtp.remote-ip=81.177.160.4
Received: from s24fifth.in-solve.ru (s24fifth.in-solve.ru [81.177.160.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81019606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 10:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81019606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfareas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfareas.com
Received: from Spooler by s24fifth.in-solve.ru (Mercury/32 v4.52) ID MO000BB1;
    23 Nov 2026 13:17:58 +0300
Received: from spooler by mail-aux1.in-solve.hidden (Mercury/32 v4.52); 23 Nov 2026 13:17:55 +0300
Received: from mail-s22 (10.0.1.22) by mail-s24-t.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG000BB0;
   23 Nov 2026 13:17:53 +0300
Received: from Spooler by mail-s22 (Mercury/32 v4.52) ID MO000CA3;
  23 Nov 2026 13:17:42 +0300
Received: from spooler by mail-s22.in-solve.hidden (Mercury/32 v4.52); 23 Nov 2026 13:17:40 +0300
Received: from ehlo.thunderbird.net (128.204.79.23) by mail-s22.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG000CA2;
   23 Nov 2026 13:17:38 +0300
Date: Mon, 23 Nov 2026 13:17:46 +0300
From: RFAREAS Support <support@rfareas.com>
To: linux-wireless@vger.kernel.org
CC: wireless-regdb@lists.infradead.org, wens@kernel.org
Subject: =?US-ASCII?Q?=5BPATCH_v2_1/2=5D_wireless-regdb=3A_Updat?=
 =?US-ASCII?Q?e_regulatory_info_for_Kazakhstan_=28KZ=29?=
User-Agent: K-9 Mail for Android
Message-ID: <2855A6B0-E021-41E9-8062-93FC37CE0F00@rfareas.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CC-Diagnostic: Header RECEIVED matches "*([0-9]+.[0-9]+.[0-9]+.[0-9]+)*" (0)

From: Valery Belousov <support@rfareas=2Ecom>

The KZ entry cites the 2015 versions of the Rules for the assignment
of frequency bands (Order No=2E 34 of 21 January 2015)=2E Item 24 "WAS/RLA=
N"
of Annex 1 to these Rules, the list of radio equipment that may be
operated without a permit, was replaced by Order No=2E 564/NK of the
Ministry of Digital Development, Innovation and Aerospace Industry of
19 September 2024 (registered with the Ministry of Justice under
No=2E 35100 on 23 September 2024, in force ten days after its first
official publication)=2E The consolidated text of the Rules on the
official legal portal adilet=2Ezan=2Ekz contains the same item=2E

Limits as stated in item 24 (all e=2Ei=2Er=2Ep=2E):
  2400-2483=2E5 MHz: 100 mW, 10 mW/MHz for wideband modulations
  5150-5350 MHz:   200 mW, 10 mW/MHz, indoor use only
  5470-5725 MHz:   100 mW, 10 mW/MHz, indoor use only
  5725-5850 MHz:   100 mW, 10 mW/MHz, indoor use only
  5925-6425 MHz:   200 mW, 10 mW/MHz, indoor use only
  57-66 GHz:       40 dBm, 13 dBm/MHz mean, indoor use only

Footnote 5=2E446A of the national table of frequency allocations requires
ITU-R Resolution 229 in 5150-5350 MHz and 5470-5725 MHz, so 5250-5350
MHz needs TPC and stays at 20 dBm without it=2E

Changes:
 * 57-66 GHz: add NO-OUTDOOR ("only for use inside a building")=2E
 * Update the source links to the current consolidated Rules, the
   amending order and the allocation table, using https, and note why
   5250-5350 MHz is limited to 20 dBm=2E

The other rules already match the item=2E The power spectral density
limits cannot be expressed in db=2Etxt=2E

Signed-off-by: Valery Belousov <support@rfareas=2Ecom>
---
v2: keep 20 dBm in 5250-5350 MHz: footnote 5=2E446A of the allocation
table applies ITU-R Resolution 229, so TPC is required (thanks, Chen-Yu)=
=2E
Cite the allocation table footnote in the comments=2E

Found while cross-checking wireless-regdb against the national acts for th=
e
RFAREAS Wi-Fi regulatory map (https://rfareas=2Ecom/blog/tools/wifimap/)=
=2E

 db=2Etxt | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/db=2Etxt b/db=2Etxt
index 43dc0b3=2E=2E3e1921d 100644
--- a/db=2Etxt
+++ b/db=2Etxt
@@ -1194,16 +1194,24 @@ country KY: DFS-FCC
 	(57000 - 71000 @ 2160), (40)
=20
 # Source:
-# http://adilet=2Ezan=2Ekz/rus/docs/V1500010730
-# http://adilet=2Ezan=2Ekz/rus/docs/V1500010375
+# Rules for the assignment of frequency bands =2E=2E=2E (Order No=2E 34 o=
f
+# 21 January 2015), Annex 1 (radio equipment that needs no permit),
+# item 24 "WAS/RLAN", as amended by Order No=2E 564/NK of 19 September 20=
24:
+# https://adilet=2Ezan=2Ekz/rus/docs/V1500010730
+# https://adilet=2Ezan=2Ekz/rus/docs/V2400035100
+# Table of frequency band allocations (Order No=2E 22 of 20 January 2015)=
;
+# its footnote 5=2E446A requires ITU-R Resolution 229 in 5150-5350 MHz an=
d
+# 5470-5725 MHz:
+# https://adilet=2Ezan=2Ekz/rus/docs/V1500010375
 country KZ: DFS-ETSI
 	(2400 - 2483=2E5 @ 40), (100 mW)
 	(5150 - 5250 @ 80), (200 mW), NO-OUTDOOR, AUTO-BW
+	# 200 mW with TPC (ITU-R Resolution 229); Linux has no TPC, so 3 dB less
 	(5250 - 5350 @ 80), (20), NO-OUTDOOR, DFS, AUTO-BW
 	(5470 - 5725 @ 160), (100 mW), NO-OUTDOOR, DFS
 	(5725 - 5850 @ 80), (100 mW), NO-OUTDOOR
 	(5925 - 6425 @ 320), (200 mW), NO-OUTDOOR
-	(57000 - 66000 @ 2160), (40)
+	(57000 - 66000 @ 2160), (40), NO-OUTDOOR
=20
 country LB: DFS-FCC
 	(2402 - 2482 @ 40), (20)
--=20
2=2E43=2E0


--=20
RFAREAS Support
