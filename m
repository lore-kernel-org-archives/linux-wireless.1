Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.177.160.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504372;
	b=MYQc+q8/Big7JszzY1Pf4ceAqFC+kwPSNOGogcfvAnryHM/cs0Yeqr+S5qw1TXTgVgJr
	 CxDh2wVL12cLRks1ovF5RbeFPOEVxFsPTvDVtZEz/rg1yTHLxlFyNShWCmwtK8OhXIrRN
	 Y4LC8WIAwlligCFzIRdbsNwF/P888eaKdn5V5Xu2pI5jzGBkhQz6TMs20JcZKKtCbX7aY
	 3bGFe5V0GlOqqrUiUr6HhZML2yb70xRuOn4l+kJlDxnVMU3pombS0kzBG8taaoSq0MtBI
	 vDo8ffTwcFlE2plCC+VmXjPaLYmBumdOg/Vb7r3SJlNCfxJbtpD3glscPCIb87V970A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504372;
	h=DMARC-Filter:Received:Received:Received:Received:Received:Received:
	 Date:From:To:CC:Subject:User-Agent:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-CC-Diagnostic;
	bh=4vQr3HN3Y0pvkzuIckMkJmRF3IhmcINm3TLdP49hxNg=;
	b=smEkeaaI5NDW0lquv7O/SENUhXxumuh9wIEI30tHrmI+DziHhOy6LA9SBFk1hGv3jxa7
	 Ehd7eFayfNEHOBXNp3CaNZwJ2gOb6oiBTPy3PYYUIeA4s1CkSbyj5IU0har0e1MnrpVZA
	 no34hGewA65a67B5O4cgZ43IerRme0/3KolMR/0ZXjlKzQ3834P2etjRw3Qs48oiYvPQB
	 msWZpZdPy0syC6rbIgamU9SOIeqRha5amjs7QEFVm6WN/bpmJrmzuK2ew9uTh2qd2CTjl
	 EUvQASm8HtM9dmj9lLWY+pIvpcmbQL2mANRFp7Jb4XBpfKBKUxtm/8J4mmWA2rwRpLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfareas.com;
	spf=pass smtp.mailfrom=rfareas.com;
	arc=none smtp.remote-ip=81.177.160.4
Received: from s24fifth.in-solve.ru (s24fifth.in-solve.ru [81.177.160.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B08C606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 07:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B08C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfareas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfareas.com
Received: from Spooler by s24fifth.in-solve.ru (Mercury/32 v4.52) ID MO000627;
    24 Nov 2026 10:12:51 +0300
Received: from spooler by mail-aux1.in-solve.hidden (Mercury/32 v4.52); 24 Nov 2026 10:12:48 +0300
Received: from mail-s22 (10.0.1.22) by mail-s24-t.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG000626;
   24 Nov 2026 10:12:46 +0300
Received: from Spooler by mail-s22 (Mercury/32 v4.52) ID MO0004CC;
  24 Nov 2026 10:12:41 +0300
Received: from spooler by mail-s22-aux1.in-solve.hidden (Mercury/32 v4.52); 24 Nov 2026 10:12:39 +0300
Received: from ehlo.thunderbird.net (128.204.79.160) by mail-s22.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG0004CB;
   24 Nov 2026 10:12:39 +0300
Date: Tue, 24 Nov 2026 10:12:42 +0300
From: RFAREAS Support <support@rfareas.com>
To: linux-wireless@vger.kernel.org
CC: wireless-regdb@lists.infradead.org, wens@kernel.org
Subject: =?US-ASCII?Q?=5BPATCH=5D_wireless-regdb=3A_Allow_5725-5875_?=
 =?US-ASCII?Q?MHz_short_range_devices_for_Georgia_=28GE=29?=
User-Agent: K-9 Mail for Android
Message-ID: <EC40FABC-4701-499A-A1D4-0BD6AB88FDF2@rfareas.com>
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

Table 1 of Annex 1 to the National Radio Frequency Spectrum Allocation
Plan (interface requirements for non-specific short range devices), as
amended by GNCC Resolution No=2E 9 of 25 July 2024, allows 5725-5875 MHz
at 25 mW e=2Ei=2Er=2Ep=2E under EN 300 440, with no duty cycle or other
condition=2E

Add it as for the other CEPT countries, and correct the comment, which
only mentioned Table 3 for this range=2E

Suggested-by: Chen-Yu Tsai <wens@kernel=2Eorg>
Signed-off-by: Valery Belousov <support@rfareas=2Ecom>
---
Found while cross-checking wireless-regdb against the national acts for th=
e
RFAREAS Wi-Fi regulatory map (https://rfareas=2Ecom/blog/tools/wifimap/)=
=2E

 db=2Etxt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/db=2Etxt b/db=2Etxt
index f92ac10=2E=2E341cb18 100644
--- a/db=2Etxt
+++ b/db=2Etxt
@@ -813,8 +813,9 @@ country GD: DFS-FCC
 # including WAS/RLAN), as amended by GNCC Resolution No=2E 9 of 25 July 2=
024:
 #  https://matsne=2Egov=2Ege/ka/document/view/6234066
 # Note 3=2E3 of the table requires TPC in 5250-5350 MHz and 5470-5725 MHz=
 and
-# lowers the limits by 3 dB without it=2E 5725-5875 MHz is listed only fo=
r
-# EN 302 502 (fixed broadband data transmission), not for WAS/RLAN=2E
+# lowers the limits by 3 dB without it=2E In 5725-5875 MHz Table 3 lists =
only
+# EN 302 502 (fixed broadband data transmission); Table 1 of the same Ann=
ex
+# allows non-specific short range devices at 25 mW e=2Ei=2Er=2Ep=2E (EN 3=
00 440)=2E
 # Harmonized CEPT countries for 6 GHz (ECC Decision (20)01)
 #  https://docdb=2Ecept=2Eorg/implementation/16737
 #  https://docdb=2Ecept=2Eorg/download/4685
@@ -825,6 +826,8 @@ country GE: DFS-ETSI
 	(5250 - 5350 @ 80), (100 mW), NO-OUTDOOR, DFS, AUTO-BW
 	# 1 W with TPC (note 3=2E3); Linux has no TPC, so 3 dB less
 	(5470 - 5725 @ 160), (500 mW), DFS
+	# short range devices (ETSI EN 300 440-1)
+	(5725 - 5875 @ 80), (25 mW)
 	(5945 - 6425 @ 320), (23), NO-OUTDOOR
 	# 60 GHz band channels 1-6, ref: ETSI EN 302 567
 	(57000 - 71000 @ 2160), (40)
--=20
2=2E43=2E0


--=20
RFAREAS Support
