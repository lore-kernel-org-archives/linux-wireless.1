Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.177.160.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464899;
	b=XbBJmaeOODHAnRWxX5xAe9Qx4OfP4PW2MR0HN2w3KGhW57QwpH8ZTnfktCnpXEWKH5xq
	 kSFpT8jiFz3g0EtrjxRc1K5H8bYNSWejwctEqGV6aEaDhCYNUZD6z4M9B/Y+hInCbHKcU
	 eBHaU9yMn7iB+q3Sm5/xKhsbpOpeBmspQqa15M8zzN07+fsqLbjhcxWtRa4OPJtXEk9g6
	 PY0cvL37D6kOyy4s8kve5cFpMaP9Ohrg9UUJKhFZaCb5JoJlMFvC8t4KM9nvZAgkgve00
	 jf95K/eb5ULa53r85+jrzBRalgxnan9oPL/D0SyrpEvXY2UrYJThgvOAP6V+EnpqPeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464899;
	h=DMARC-Filter:Received:Received:Received:Received:Received:Received:
	 Date:From:To:CC:Subject:User-Agent:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-CC-Diagnostic;
	bh=eM+N0pRNw56oYj8mhCbTBxnx9bPCLxXhM3kU/ZHjQKE=;
	b=owbhiTym3rv7CvfC03fciKJffVPG6DXZroOvXYDlztSSAnZo7i3L6rPmXvhaY71MMZdO
	 TwkAkHabi9KtNeyiXKGGpLLxAbVLN7L9+Cm1NwwltGECk3l5Il1DgHZFPdmWTeno/Nddk
	 FufHAB1DtL5miRTlOmayb9j3OofWQ9yeYUD72fO5+xyB3p2c1FQWQPcaVL465iXnW8HM4
	 TJHKXDTWFPWxLd/7scFatX1J0yzelXdGReop6bvUbBrirpfm/GCaGV4oPGMz7YQwEr+9q
	 PnEQm0SDBM7/t3sfrkCT7Ce2HA6whYjv72dVUsh/jRBnWWroVPlqwrmdXL7C8ybVryQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfareas.com;
	spf=pass smtp.mailfrom=rfareas.com;
	arc=none smtp.remote-ip=81.177.160.4
Received: from s24fifth.in-solve.ru (s24fifth.in-solve.ru [81.177.160.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC89F606A31E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 20:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC89F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfareas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfareas.com
Received: from Spooler by s24fifth.in-solve.ru (Mercury/32 v4.52) ID MO0016DA;
    23 Nov 2026 23:15:00 +0300
Received: from spooler by mail-aux1.in-solve.hidden (Mercury/32 v4.52); 23 Nov 2026 23:14:39 +0300
Received: from mail-s22 (10.0.1.22) by mail-s24-t.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG0016D9;
   23 Nov 2026 23:14:39 +0300
Received: from Spooler by mail-s22 (Mercury/32 v4.52) ID MO0000F0;
  23 Nov 2026 23:14:25 +0300
Received: from spooler by mail-s22-aux2.in-solve.hidden (Mercury/32 v4.52); 23 Nov 2026 23:14:23 +0300
Received: from ehlo.thunderbird.net (128.204.79.160) by mail-s22.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG0000EF;
   23 Nov 2026 23:14:21 +0300
Date: Mon, 23 Nov 2026 23:14:32 +0300
From: RFAREAS Support <support@rfareas.com>
To: linux-wireless@vger.kernel.org
CC: wireless-regdb@lists.infradead.org, wens@kernel.org
Subject: [PATCH] wireless-regdb: Update 60 GHz rule for Ukraine (UA)
User-Agent: K-9 Mail for Android
Message-ID: <2D65518A-EBD5-4E6C-B4D2-7819D488B374@rfareas.com>
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

The UA entry allows 40 dBm in 57-66 GHz=2E The current list of radio
equipment used under general authorisation in Ukraine, NKEK Resolution
No=2E 361 of 3 July 2024, allows MGWS (WAS/RLAN) equipment in 57-66 GHz
under item 78 with a maximum mean e=2Ei=2Er=2Ep=2E density of 13 dBm in an=
y 1 MHz,
a maximum e=2Ei=2Er=2Ep=2E of 20 dBm and indoor use only (ETSI EN 302 567)=
=2E
The amendments to the list adopted since then (Resolution No=2E 32 of
28 January 2026, current consolidated version of 18 March 2026) do not
change this item=2E

Change 57-66 GHz from 40 dBm to 20 dBm (NO-OUTDOOR is kept) and add
the source=2E

The source cited for the 2=2E4 and 5 GHz rules (z0201-15) was repealed by
Resolution No=2E 361 on 16 August 2024=2E Those rules are not changed here=
=2E

Signed-off-by: Valery Belousov <support@rfareas=2Ecom>
---
Found while cross-checking wireless-regdb against the national acts for th=
e
RFAREAS Wi-Fi regulatory map (https://rfareas=2Ecom/blog/tools/wifimap/)=
=2E

 db=2Etxt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/db=2Etxt b/db=2Etxt
index f5b7cc1=2E=2E07c3ef9 100644
--- a/db=2Etxt
+++ b/db=2Etxt
@@ -2097,6 +2097,10 @@ country TZ: DFS-ETSI
 # 2=2E4 GHz band channels can be used outdoors when some requirements are=
 met=2E
 # 5 GHz band channels must be used only indoors in some cases=2E They are=
 neither
 # permitted nor denied outdoors in others=2E
+# 60 GHz: NKEK Resolution No=2E 361 of 3 July 2024, list of radio equipme=
nt
+# used under general authorisation, item 78 (MGWS, 57-66 GHz): 20 dBm
+# e=2Ei=2Er=2Ep=2E, 13 dBm/MHz, indoor use only=2E
+#  https://zakon=2Erada=2Egov=2Eua/laws/show/z1175-24
 # Harmonized CEPT countries for 6 GHz (ECC Decision (20)01)
 #  https://docdb=2Ecept=2Eorg/implementation/16737
 #  https://docdb=2Ecept=2Eorg/download/4685
@@ -2108,7 +2112,7 @@ country UA: DFS-ETSI
 	(5725 - 5850 @ 80), (100 mW), NO-OUTDOOR
 	(5945 - 6425 @ 320), (23), NO-OUTDOOR
 	# 60 GHz band channels 1-4, ref: Etsi En 302 567
-	(57000 - 66000 @ 2160), (40), NO-OUTDOOR
+	(57000 - 66000 @ 2160), (20), NO-OUTDOOR
=20
 country UG: DFS-FCC
 	(2402 - 2482 @ 40), (20)
--=20
2=2E43=2E0

--=20
RFAREAS Support
