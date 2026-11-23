Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.177.160.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429360;
	b=nSSZEzF7eImer9gBQjZvAsZDZI2E80HIGDZCgPGUpbeq+vCFT4pBK2/I1c/snYCuhwn6
	 Xf7bMuha5WfMtatgl2qHVsDjNO97Bskux/CDaNQPe4LiytorVT8DXCCQ4Pj+ni0g3pe8G
	 PqORf4azaUvhb8WGZFQp4O4uNcB3zPQ3cvI6Gd3Xjm66k7C6qxxNAQKUCLV8hcIsLHvk/
	 aw1YyVbshU6IEcJufCvwiok0MJUIz0XLtI8toFt30cjOyK1HDJDmQpdVOPVDg/lrr+/lO
	 hpYqAuCoAGl4Z3jQmh4NBGSFmd8yeNZmitvT1DHyzz4dGUmqdTz4Tkrh0N/aNIVaEtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429360;
	h=DMARC-Filter:Received:Received:Received:Received:Received:Received:
	 Date:From:To:CC:Subject:User-Agent:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-CC-Diagnostic;
	bh=R9THjgpuvABTM8Wxex1Yp+3V5Z4qPyoJ2aRaF3usfMU=;
	b=qPUWHT+u/PCOwYYkNHs9VDzU3rblrPoHtbcevATIRUN/hJqM34svT8Cb719+BHvxGkk8
	 Zv52V8jtGjqvgfD09hes3qqQ24lHLc9Ifj8Ere+/piJxPZr0MXzHO2M969W28jrukLa3u
	 dTcvb6Eqw3IPgvibkoSRhiErhpy9hF6lqFZqz3yvFiB1FVgYpnsc4eSlhiuqA0bLoONgX
	 4Ap7E8jkxyIv2BpPnV4zNvcw90Ak0zlbGw+oZB7qQRb5KWo0wfIS45tcvBc8DhWIl4nM1
	 cFXuuzbIjiOjHWrgDJnsJPG8eGsfPsV4UzPIOnkz6OpSL3r78E7R44Vy87RH6XrrroQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfareas.com;
	spf=pass smtp.mailfrom=rfareas.com;
	arc=none smtp.remote-ip=81.177.160.4
Received: from s24fifth.in-solve.ru (s24fifth.in-solve.ru [81.177.160.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C868F606A31E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 10:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C868F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfareas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfareas.com
Received: from Spooler by s24fifth.in-solve.ru (Mercury/32 v4.52) ID MO000BF3;
    23 Nov 2026 13:22:41 +0300
Received: from spooler by mail-aux1.in-solve.hidden (Mercury/32 v4.52); 23 Nov 2026 13:22:38 +0300
Received: from mail-s22 (10.0.1.22) by mail-s24-t.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG000BF2;
   23 Nov 2026 13:22:37 +0300
Received: from Spooler by mail-s22 (Mercury/32 v4.52) ID MO000CC1;
  23 Nov 2026 13:22:33 +0300
Received: from spooler by mail-s22.in-solve.hidden (Mercury/32 v4.52); 23 Nov 2026 13:22:30 +0300
Received: from ehlo.thunderbird.net (128.204.79.23) by mail-s22.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG000CC0;
   23 Nov 2026 13:22:28 +0300
Date: Mon, 23 Nov 2026 13:22:29 +0300
From: RFAREAS Support <support@rfareas.com>
To: linux-wireless@vger.kernel.org
CC: wireless-regdb@lists.infradead.org, wens@kernel.org
Subject: [PATCH v2 2/2] wireless-regdb: Allow channel 144 for Kazakhstan (KZ)
User-Agent: K-9 Mail for Android
Message-ID: <8BB6488B-D0B9-4ECB-9740-E892DDA3F4C1@rfareas.com>
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

Channel 144 (5710-5730 MHz) straddles the 5725 MHz boundary between
the 5470-5725 MHz and 5725-5850 MHz rules, so it cannot be used=2E

Both ranges have the same limits in item 24 of Annex 1 to the Rules
(100 mW e=2Ei=2Er=2Ep=2E, indoor use only); 5725-5850 MHz has no DFS flag =
and
is the less restrictive one=2E Extend the lower range to 5730 MHz and
start the upper one there, as done for the US=2E 5725-5730 MHz then
requires DFS, which is more restrictive than before=2E

Suggested-by: Chen-Yu Tsai <wens@kernel=2Eorg>
Signed-off-by: Valery Belousov <support@rfareas=2Ecom>
---
New in v2, as requested in the review of v1=2E

 db=2Etxt | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/db=2Etxt b/db=2Etxt
index 3e1921d=2E=2Eae49c0c 100644
--- a/db=2Etxt
+++ b/db=2Etxt
@@ -1208,8 +1208,12 @@ country KZ: DFS-ETSI
 	(5150 - 5250 @ 80), (200 mW), NO-OUTDOOR, AUTO-BW
 	# 200 mW with TPC (ITU-R Resolution 229); Linux has no TPC, so 3 dB less
 	(5250 - 5350 @ 80), (20), NO-OUTDOOR, DFS, AUTO-BW
-	(5470 - 5725 @ 160), (100 mW), NO-OUTDOOR, DFS
-	(5725 - 5850 @ 80), (100 mW), NO-OUTDOOR
+	# This range ends at 5725 MHz, but channel 144 extends to 5730 MHz=2E
+	# Since 5725 ~ 5730 MHz belongs to the next range which has looser
+	# requirements, we can extend the range by 5 MHz to make the kernel
+	# happy and be able to use channel 144=2E
+	(5470 - 5730 @ 160), (100 mW), NO-OUTDOOR, DFS
+	(5730 - 5850 @ 80), (100 mW), NO-OUTDOOR
 	(5925 - 6425 @ 320), (200 mW), NO-OUTDOOR
 	(57000 - 66000 @ 2160), (40), NO-OUTDOOR
=20
--=20
2=2E43=2E0


--=20
RFAREAS Support
