Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.177.160.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464263;
	b=NznsbKhXY9YI5wDRMx9LqPWs1Bv+c1iDylk12POweidXamV0bKr5E1FD+vYWcUqFxG/Y
	 Mv6MR898n4s2nkh3dyACKd1vXlNze3aPABn8Mq7xBaqh7H5+OoDCXObo8pUdgQo7q8fRO
	 mUPYDT1lugGDdze9cptlEUEjxaRpLm24mqqfdEycII0TblA9iA+PCNSpSCfxywm78B518
	 zuJFJRhvgjZQfNe1py17cvJXl9nsKddfUSIHjvn/Fe3oz0RtdxBzSQr2FW5nHv9UBk5FS
	 XfQOmFpeR2UYfaBAX5k+2yfbZSk/AESYZbbxnPftdXHbyXmKkZ5tDW/DE65vr/I3Jiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464263;
	h=DMARC-Filter:Received:Received:Received:Received:Received:Received:
	 Date:From:To:CC:Subject:User-Agent:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-CC-Diagnostic;
	bh=/AQj7AzfV6SoS+vYzvPhpxO75RyAaQNmq2a9bV5+1WM=;
	b=0uk09yKFjgg4lXKf9r40fXAVSbWtvDYm5AJyu+PTj641ds6yXtRe0rL7cshcO/X8RMSk
	 dOMAo9kne/OeHjZYMFs4CLtv8BpAx6Wb5xKem6aM22sj6R8MgMB4iKDou69DRCiXqvhhc
	 B7wb1kXh0rYKMZPmuJ+PqU/wT54yXA8eC2cxEFd1x24lfPTyHk61DFHbscEk4xCKoX/2M
	 NJp1ATK4rqnysAnrkinS/lmtcqIsBCoIO+lJSO7DMFEByqgyGqIHdDs39Y8G7ThdWTAxW
	 a5BfkXsrQtt6QS0Do+LlrJ8VANLU7l8/oqVaTFvrNy/dzF9fRfBNzVBK0AiPmYlljGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfareas.com;
	spf=pass smtp.mailfrom=rfareas.com;
	arc=none smtp.remote-ip=81.177.160.4
Received: from s24fifth.in-solve.ru (s24fifth.in-solve.ru [81.177.160.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1563C606A31E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 20:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1563C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfareas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfareas.com
Received: from Spooler by s24fifth.in-solve.ru (Mercury/32 v4.52) ID MO0016CE;
    23 Nov 2026 23:04:23 +0300
Received: from spooler by mail-aux1.in-solve.hidden (Mercury/32 v4.52); 23 Nov 2026 23:04:07 +0300
Received: from mail-s22 (10.0.1.22) by mail-s24-t.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG0016CD;
   23 Nov 2026 23:04:05 +0300
Received: from Spooler by mail-s22 (Mercury/32 v4.52) ID MO0000E1;
  23 Nov 2026 23:04:03 +0300
Received: from spooler by mail-s22-aux2.in-solve.hidden (Mercury/32 v4.52); 23 Nov 2026 23:04:01 +0300
Received: from ehlo.thunderbird.net (128.204.79.160) by mail-s22.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG0000E0;
   23 Nov 2026 23:03:59 +0300
Date: Mon, 23 Nov 2026 23:04:00 +0300
From: RFAREAS Support <support@rfareas.com>
To: linux-wireless@vger.kernel.org
CC: wireless-regdb@lists.infradead.org, wens@kernel.org
Subject: [PATCH] wireless-regdb: Update regulatory info for Georgia (GE)
User-Agent: K-9 Mail for Android
Message-ID: <C1FB55C5-D453-4358-856A-54D0097561C8@rfareas.com>
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

The GE entry has no source for the 2=2E4 and 5 GHz rules and does not
allow 5470-5725 MHz, which is permitted for licence-exempt use in
Georgia=2E

Licence-exempt WAS/RLAN is set out in Table 3 of Annex 1 to the
National Radio Frequency Spectrum Allocation Plan (GNCC Resolution
No=2E 6 of 30 June 2006), as amended by GNCC Resolution No=2E 9 of
25 July 2024, published on the official legislative portal matsne=2Egov=2E=
ge=2E

Limits as stated in Table 3 (all e=2Ei=2Er=2Ep=2E):
  2400-2483=2E5 MHz: 100 mW, 10 mW/MHz for wideband modulations
  5150-5350 MHz:   200 mW mean, 10 mW/MHz, indoor use only
  5470-5725 MHz:   1 W mean, 50 mW/MHz
  5945-6425 MHz:   200 mW mean
  57-71 GHz:       40 dBm mean, 23 dBm/MHz, fixed outdoor excluded
Note 3=2E2 requires DFS (as in EN 301 893) in 5250-5350 MHz and
5470-5725 MHz=2E Note 3=2E3 requires TPC in the same bands and lowers the
e=2Ei=2Er=2Ep=2E limits by 3 dB if TPC is not used=2E

Changes:
 * 2=2E4 GHz: 2400-2483=2E5 MHz, 100 mW=2E
 * 5150-5250 MHz: 200 mW (was 18 dBm), NO-OUTDOOR=2E
 * 5250-5350 MHz: 100 mW (was 18 dBm, 5250-5330 MHz), NO-OUTDOOR, DFS
   (200 mW with TPC)=2E
 * Add 5470-5725 MHz, 500 mW, DFS (1 W with TPC)=2E
 * 60 GHz: extend to 71 GHz as in the table=2E
 * Add the source and the TPC note=2E

5725-5875 MHz is listed in the table only for EN 302 502 (fixed
broadband data transmission systems), not for WAS/RLAN under
EN 301 893, so it is not added=2E The 6 GHz rule already matches=2E

Signed-off-by: Valery Belousov <support@rfareas=2Ecom>
---
Found while cross-checking wireless-regdb against the national acts for th=
e
RFAREAS Wi-Fi regulatory map (https://rfareas=2Ecom/blog/tools/wifimap/)=
=2E

 db=2Etxt | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/db=2Etxt b/db=2Etxt
index f5b7cc1=2E=2Eac9aad5 100644
--- a/db=2Etxt
+++ b/db=2Etxt
@@ -808,16 +808,26 @@ country GD: DFS-FCC
 	(5735 - 5835 @ 80), (30)
=20
 # Source:
+# National Radio Frequency Spectrum Allocation Plan (GNCC Resolution No=
=2E 6
+# of 30 June 2006), Annex 1, Table 3 (wideband data transmission systems,
+# including WAS/RLAN), as amended by GNCC Resolution No=2E 9 of 25 July 2=
024:
+#  https://matsne=2Egov=2Ege/ka/document/view/6234066
+# Note 3=2E3 of the table requires TPC in 5250-5350 MHz and 5470-5725 MHz=
 and
+# lowers the limits by 3 dB without it=2E 5725-5875 MHz is listed only fo=
r
+# EN 302 502 (fixed broadband data transmission), not for WAS/RLAN=2E
 # Harmonized CEPT countries for 6 GHz (ECC Decision (20)01)
 #  https://docdb=2Ecept=2Eorg/implementation/16737
 #  https://docdb=2Ecept=2Eorg/download/4685
 country GE: DFS-ETSI
-	(2402 - 2482 @ 40), (20)
-	(5170 - 5250 @ 80), (18), AUTO-BW
-	(5250 - 5330 @ 80), (18), DFS, AUTO-BW
+	(2400 - 2483=2E5 @ 40), (100 mW)
+	(5150 - 5250 @ 80), (200 mW), NO-OUTDOOR, AUTO-BW
+	# 200 mW with TPC (note 3=2E3); Linux has no TPC, so 3 dB less
+	(5250 - 5350 @ 80), (100 mW), NO-OUTDOOR, DFS, AUTO-BW
+	# 1 W with TPC (note 3=2E3); Linux has no TPC, so 3 dB less
+	(5470 - 5725 @ 160), (500 mW), DFS
 	(5945 - 6425 @ 320), (23), NO-OUTDOOR
-	# 60 GHz band channels 1-4, ref: Etsi En 302 567
-	(57000 - 66000 @ 2160), (40)
+	# 60 GHz band channels 1-6, ref: ETSI EN 302 567
+	(57000 - 71000 @ 2160), (40)
=20
 country GF: DFS-ETSI
 	(2402 - 2482 @ 40), (20)
--=20
2=2E43=2E0


--=20
RFAREAS Support
