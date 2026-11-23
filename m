Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.177.160.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429461;
	b=C/QU3uLKcBINtFs3EeSfWe0auEMepmWIhpzsK/KprYm6bzXtnowxPh9oM8fCN3GsxpdN
	 D6IQOa9MWT8nX1KqJhjjDwLjaKgV9ir63EOMvEjEcpcK+KytnBsYocGLGwazkCIu6aWtV
	 3R1WeIlsVqdt8nCLbMxYyKFoMeqvSGCAoXQl35poMTMkFwqfOvj9ch8v9r+1Izw7TiVI/
	 zGUoD+sQlSMtisugg3MWLuVyDw9VDNXufpWJAdP3lnplaUDRyWz/QUc8xBD+huHF1nOuT
	 l+ZGkhf1B9GQRc7j/Af56gGvxVH43T+1FyYfrn1FytMvyeBtPUvZe5VsKUrR5688zNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429461;
	h=DMARC-Filter:Received:Received:Received:Received:Received:Received:
	 Date:From:To:CC:Subject:User-Agent:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-CC-Diagnostic;
	bh=fJ11GKOjructH2+ApxtwE2ooJvlCQ/t3COzXIxaYx+E=;
	b=Twi+EEiNG9kO/GHBRpfRVudUbUGKyUj4V4wMiNg9qgFbNqCTZC527bP6J11knSMoGOuF
	 2eDuSk3HY/TXYE7bJhu71smc/47SJuVqOprfUvCU2n4DG8biy14gZI4Fo7cyOFC7f0JkQ
	 yF3IbpCKGkQYE3hMftCEc36t4mC3vJqRKMwghcx5OH/VQj66z0zU9/pXSZOU0ZUrP85gX
	 lXwAdE/ueZLS4TQCkCxA32hSDDlOSRMVHVQ8EDMT60lBPKnueiA+XPeEuZJ02W/KDtUPa
	 aTOBhEIfvJhwrwzJ8CaOGc9G+xQCAON0qyDEG44XweEHBGDrdVCc7jHZmJMvHSj4GLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfareas.com;
	spf=pass smtp.mailfrom=rfareas.com;
	arc=none smtp.remote-ip=81.177.160.4
Received: from s24fifth.in-solve.ru (s24fifth.in-solve.ru [81.177.160.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC36606A330
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 10:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFC36606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfareas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfareas.com
Received: from Spooler by s24fifth.in-solve.ru (Mercury/32 v4.52) ID MO000C0A;
    23 Nov 2026 13:24:21 +0300
Received: from spooler by mail-aux1.in-solve.hidden (Mercury/32 v4.52); 23 Nov 2026 13:24:18 +0300
Received: from mail-s22 (10.0.1.22) by mail-s24-t.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG000C09;
   23 Nov 2026 13:24:18 +0300
Received: from Spooler by mail-s22 (Mercury/32 v4.52) ID MO000CC9;
  23 Nov 2026 13:24:13 +0300
Received: from spooler by mail-s22.in-solve.hidden (Mercury/32 v4.52); 23 Nov 2026 13:24:12 +0300
Received: from ehlo.thunderbird.net (128.204.79.23) by mail-s22.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG000CC8;
   23 Nov 2026 13:24:10 +0300
Date: Mon, 23 Nov 2026 13:24:12 +0300
From: RFAREAS Support <support@rfareas.com>
To: linux-wireless@vger.kernel.org
CC: wireless-regdb@lists.infradead.org, wens@kernel.org
Subject: [PATCH v2] wireless-regdb: Update regulatory info for Belarus (BY)
User-Agent: K-9 Mail for Android
Message-ID: <78DCED16-8799-423B-BC5D-91690821B766@rfareas.com>
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

The BY entry has no source and allows 5490-5710 MHz at 27 dBm, which
is not permitted for licence-exempt use in Belarus=2E

Licence-exempt Wi-Fi is set out in Resolution No=2E 9 of the Ministry
of Communications and Informatization of 1 July 2013, the list of radio
equipment operated without a frequency assignment permit=2E Items 7 and 8
were replaced by Resolution No=2E 13 of 29 August 2016; Resolution No=2E 1
of 10 January 2018 changed "output power" in item 7 to "e=2Ei=2Er=2Ep=2E"=
=2E
All three acts are published on the National Legal Internet Portal
pravo=2Eby=2E

Limits as stated in the resolution:
  item 7, 2400-2483=2E5 MHz: 100 mW e=2Ei=2Er=2Ep=2E
  item 8, 5150-5350 MHz and 5650-5725 MHz: 200 mW e=2Ei=2Er=2Ep=2E
Both items: IEEE 802=2E11 equipment installed inside buildings,
structures and vehicles, not using antennas installed outside them=2E

Changes:
 * 2=2E4 GHz: 2400-2483=2E5 MHz, 100 mW, NO-OUTDOOR=2E
 * 5150-5250 MHz: 200 mW (was 20 dBm), NO-OUTDOOR=2E
 * 5250-5350 MHz: 100 mW, NO-OUTDOOR, DFS=2E Footnote 5=2E446A of the
   national table of frequency allocations (Council of Ministers
   Resolution No=2E 620 of 9 August 2016) requires ITU-R Resolution 229
   in 5150-5350 MHz and 5470-5725 MHz, so TPC is needed in 5250-5350
   MHz and the limit is 3 dB lower without it=2E In 5650-5725 MHz the
   national 200 mW is already below the Resolution 229 limit without
   TPC (500 mW)=2E
 * Replace 5490-5710 MHz with 5650-5725 MHz, 200 mW, NO-OUTDOOR, DFS=2E
   The band is 75 MHz wide, so the maximum bandwidth is 40 MHz=2E
 * Add the sources, including the allocation table=2E

Item 18, added by Resolution No=2E 2 of 24 January 2019, also lists
5785-5875 MHz, but only for use in Minsk during the II European Games
2019, so it is not included=2E

Signed-off-by: Valery Belousov <support@rfareas=2Ecom>
---
v2: 5250-5350 MHz limited to 100 mW without TPC: the allocation table's
footnote 5=2E446A applies ITU-R Resolution 229 (thanks, Chen-Yu)=2E
Cite the allocation table=2E

Found while cross-checking wireless-regdb against the national acts for th=
e
RFAREAS Wi-Fi regulatory map (https://rfareas=2Ecom/blog/tools/wifimap/)=
=2E

 db=2Etxt | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/db=2Etxt b/db=2Etxt
index 43dc0b3=2E=2E9721f53 100644
--- a/db=2Etxt
+++ b/db=2Etxt
@@ -386,11 +386,26 @@ country BW: DFS-ETSI
 	(5470 - 5725 @ 160), (250 mW), DFS
 	(5725 - 5850 @ 80), (24), DFS
=20
+# Source:
+# Resolution of the Ministry of Communications and Informatization No=2E =
9
+# of 1 July 2013 (radio equipment operated without a frequency assignment
+# permit), items 7 and 8, as amended by Resolution No=2E 13 of 29 August =
2016
+# and Resolution No=2E 1 of 10 January 2018:
+# https://pravo=2Eby/document/?guid=3D3961&p0=3DW21327720
+# https://pravo=2Eby/document/?guid=3D3961&p0=3DW21631260
+# https://pravo=2Eby/document/?guid=3D3961&p0=3DW21832737
+# Both items allow use only inside buildings, structures and vehicles,
+# without antennas outside them=2E
+# Table of frequency band allocations (Council of Ministers Resolution
+# No=2E 620 of 9 August 2016); its footnote 5=2E446A requires ITU-R
+# Resolution 229 in 5150-5350 MHz and 5470-5725 MHz:
+# https://pravo=2Eby/document/?guid=3D3961&p0=3DC21600620
 country BY: DFS-ETSI
-	(2402 - 2482 @ 40), (20)
-	(5170 - 5250 @ 80), (20), AUTO-BW
-	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
-	(5490 - 5710 @ 160), (27), DFS
+	(2400 - 2483=2E5 @ 40), (100 mW), NO-OUTDOOR
+	(5150 - 5250 @ 80), (200 mW), NO-OUTDOOR, AUTO-BW
+	# 200 mW with TPC (ITU-R Resolution 229); Linux has no TPC, so 3 dB less
+	(5250 - 5350 @ 80), (100 mW), NO-OUTDOOR, DFS, AUTO-BW
+	(5650 - 5725 @ 40), (200 mW), NO-OUTDOOR, DFS
=20
 country BZ: DFS-JP
 	(2402 - 2482 @ 40), (30)
--=20
2=2E43=2E0


--=20
RFAREAS Support
