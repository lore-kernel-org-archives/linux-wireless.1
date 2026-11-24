Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.177.160.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504910;
	b=JLT5TcopS+SoiO2P+BU1JF1KRyP87CLTpuNlWihWE8fxr7f1t0RseTE68tZMo0q7glJ4
	 OkFImAFcibL9PeSkQlfy3KQvjF2bmkEffxrdoh6+9HBE2o2mbl4d+V6z7AOHD5roZDnI2
	 qL6S5lGTpUVMjQsrDVh4+6nUT4J8odBTd6nS4G2fm9MrxbJZqQ1tTCDXjNYH5roCzhDnX
	 04VREtIUBK5EBaQuT8znSCV2/FVmAT0AZwxaGMxqXFgLMyFa7TQ13AUxDp1sSmjDnTdf4
	 8RNi7/oKhgNAAyD9SSExQxltj5Y83iDqYMC8+9oymNJ0rAhdt9FZrAQm6RE06I+sB0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504910;
	h=DMARC-Filter:Received:Received:Received:Received:Received:Received:
	 Date:From:To:CC:Subject:User-Agent:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-CC-Diagnostic;
	bh=Eo2j+D2NjuWBFz83/QfJLvhKANH4iDC/QgJgThvrGJk=;
	b=fnWtvH/nVm3FSvogj59yL3WEG6b3cV+54PCIEShWjnMlFc0XC3ZPtOOdv7C9GqXNWDOC
	 q16bEugWiW22wwbZfV7stlE7QNjeNHSgUso6x1wZ6sljWvBTDsi1nitgd0VluyzxqeTnB
	 rpA+FmsvFDBTaHH9SgMViJeUNldB9YuAAJ+5RwSyEQrRD6AHg1drAum5W0qvv7oJ3BXgN
	 noD+eCWDnIRR8P0nLoMb40i1364Mf5qXof6ITmH48pTcMb2URDPFGgINlxRhxr6TONH/v
	 WJ09QelGeV3Y+33U9f81wfJQiYLSeqUP0piw0TdJf1M925dZotg+K7ZMk+Daaw/tiAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfareas.com;
	spf=pass smtp.mailfrom=rfareas.com;
	arc=none smtp.remote-ip=81.177.160.4
Received: from s24fifth.in-solve.ru (s24fifth.in-solve.ru [81.177.160.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14705606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 07:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14705606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfareas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfareas.com
Received: from Spooler by s24fifth.in-solve.ru (Mercury/32 v4.52) ID MO000676;
    24 Nov 2026 10:21:49 +0300
Received: from spooler by mail-aux1.in-solve.hidden (Mercury/32 v4.52); 24 Nov 2026 10:21:45 +0300
Received: from mail-s22 (10.0.1.22) by mail-s24-t.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG000675;
   24 Nov 2026 10:21:44 +0300
Received: from Spooler by mail-s22 (Mercury/32 v4.52) ID MO000503;
  24 Nov 2026 10:21:29 +0300
Received: from spooler by mail-s22-aux1.in-solve.hidden (Mercury/32 v4.52); 24 Nov 2026 10:21:27 +0300
Received: from ehlo.thunderbird.net (128.204.79.160) by mail-s22.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG000502;
   24 Nov 2026 10:21:26 +0300
Date: Tue, 24 Nov 2026 10:21:40 +0300
From: RFAREAS Support <support@rfareas.com>
To: linux-wireless@vger.kernel.org
CC: wireless-regdb@lists.infradead.org, wens@kernel.org
Subject: [PATCH] wireless-regdb: Allow outdoor use of 2.4 GHz for Ukraine (UA)
User-Agent: K-9 Mail for Android
Message-ID: <119360F5-6878-4218-AB28-D56C4E76C999@rfareas.com>
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

The UA entry marks 2400-2483=2E5 MHz NO-OUTDOOR=2E In the current list of
radio equipment used under general authorisation (NKEK Resolution
No=2E 361 of 3 July 2024), item 53 allows Wi-Fi access points in
2400-2483=2E5 MHz at 100 mW e=2Ei=2Er=2Ep=2E "inside and outside premises"=
, with
the antenna at most 6 m above ground, and item 52 (RLAN terminal
equipment, 100 mW e=2Ei=2Er=2Ep=2E, 10 mW/MHz) has no indoor-only conditio=
n=2E
Resolution No=2E 32 of 28 January 2026 does not change these items=2E

Remove NO-OUTDOOR from 2400-2483=2E5 MHz and cite the items=2E

Suggested-by: Chen-Yu Tsai <wens@kernel=2Eorg>
Signed-off-by: Valery Belousov <support@rfareas=2Ecom>
---
Found while cross-checking wireless-regdb against the national acts for th=
e
RFAREAS Wi-Fi regulatory map (https://rfareas=2Ecom/blog/tools/wifimap/)=
=2E

 db=2Etxt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/db=2Etxt b/db=2Etxt
index f92ac10=2E=2Ed13a208 100644
--- a/db=2Etxt
+++ b/db=2Etxt
@@ -2110,12 +2110,15 @@ country TZ: DFS-ETSI
 # 60 GHz: NKEK Resolution No=2E 361 of 3 July 2024, list of radio equipme=
nt
 # used under general authorisation, item 78 (MGWS, 57-66 GHz): 20 dBm
 # e=2Ei=2Er=2Ep=2E, 13 dBm/MHz, indoor use only=2E
+# 2=2E4 GHz: items 52 (RLAN terminals) and 53 (Wi-Fi access points) of th=
e
+# same list: 100 mW e=2Ei=2Er=2Ep=2E; access points indoors and outdoors,=
 with the
+# antenna at most 6 m above ground=2E
 #  https://zakon=2Erada=2Egov=2Eua/laws/show/z1175-24
 # Harmonized CEPT countries for 6 GHz (ECC Decision (20)01)
 #  https://docdb=2Ecept=2Eorg/implementation/16737
 #  https://docdb=2Ecept=2Eorg/download/4685
 country UA: DFS-ETSI
-	(2400 - 2483=2E5 @ 40), (100 mW), NO-OUTDOOR
+	(2400 - 2483=2E5 @ 40), (100 mW)
 	(5150 - 5250 @ 80), (100 mW), NO-OUTDOOR, AUTO-BW, wmmrule=3DETSI
 	(5250 - 5350 @ 80), (100 mW), DFS, NO-OUTDOOR, AUTO-BW, wmmrule=3DETSI
 	(5470 - 5725 @ 160), (100 mW), DFS, NO-OUTDOOR, wmmrule=3DETSI
--=20
2=2E43=2E0

--=20
RFAREAS Support
