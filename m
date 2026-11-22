Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.177.160.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371251;
	b=OXa+GnZnAWIfymxbWUs67bq/XD3Vn4ED/xUY+KiJ74OUaY/uIkIo7nT7HNjhQwWKIm4z
	 1RbLg6t02bTbL5OrW0qQAH72i8wjXVm0S0B+EmKfqQ0cg9Cf91K0YzgByasOCLBqYnPJo
	 18qyuXaYoUfERiXNBS0lU5I1H1XvefDkYZ3TFSwHRr3jbwSwPee0gSz98mEMRcC8eeYCA
	 +erg0OaxyqShYmjDmDrfdB2cDbPlo6+7+5nAku3f0cdknQoEaQRArZdwKL6vB8LpvDfRD
	 uMANzzBa+rhvZ+9FzEXoATO8WCi/SNkY5S163/yCEbbKvYK0ln2pbv91kwKN9kh0gbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371251;
	h=DMARC-Filter:Received:Received:Received:Received:Received:Received:
	 Date:From:To:CC:Subject:User-Agent:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-CC-Diagnostic;
	bh=B1LYigBhkSDFrcBB7bxoVvP2C8fiwp42ASiu1+urQAo=;
	b=C2pZYYKW94SJv1XTyxTZiBUo+gr5MryhZMN+92IFK1IRjhRt4jCpDTFBfqMVD6BNncv9
	 rgPMyAFWup+RmZU/8riwGh0qo7PDYPxFDWAMlocpSK5tAOksOqoJyPa7LJBW9wyJp+7ym
	 8CyGQW5TZLcVjOqy20q2+zPEnHFYt/AC4dLuTqp+8TLxPyEbDbTxaCYFAg/liKYpVmX3H
	 RtZc/47PwifMuz67uLLLkWxOc1Wx0dgc5OISk1VCcnX+i2BEL91pNsh0btVR//QIWHBJl
	 C9VUalYleLKugn/MiuBI6stWIedK4DAeO9EhI7F/FE1w3yi+Gym5VwkcnesYs09K76g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfareas.com;
	spf=pass smtp.mailfrom=rfareas.com;
	arc=none smtp.remote-ip=81.177.160.4
Received: from s24fifth.in-solve.ru (s24fifth.in-solve.ru [81.177.160.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD5D606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 18:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FD5D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfareas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfareas.com
Received: from Spooler by s24fifth.in-solve.ru (Mercury/32 v4.52) ID MO00041E;
    22 Nov 2026 21:14:09 +0300
Received: from spooler by mail-aux1.in-solve.hidden (Mercury/32 v4.52); 22 Nov 2026 21:14:05 +0300
Received: from mail-s22 (10.0.1.22) by mail-s24-t.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG00041D;
   22 Nov 2026 21:14:04 +0300
Received: from Spooler by mail-s22 (Mercury/32 v4.52) ID MO00004D;
  22 Nov 2026 21:14:00 +0300
Received: from spooler by mail-s22-aux3.in-solve.hidden (Mercury/32 v4.52); 22 Nov 2026 21:13:58 +0300
Received: from ehlo.thunderbird.net (128.204.79.33) by mail-s22.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG00004C;
   22 Nov 2026 21:13:56 +0300
Date: Sun, 22 Nov 2026 21:13:58 +0300
From: RFAREAS Support <support@rfareas.com>
To: linux-wireless@vger.kernel.org
CC: wireless-regdb@lists.infradead.org, wens@kernel.org
Subject: [PATCH] wireless-regdb: Update regulatory info for Belarus (BY)
User-Agent: K-9 Mail for Android
Message-ID: <5DB6FB38-A5F9-4CD4-8AAE-7A3FCFF90520@rfareas.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary=----4CJO01DI4FY2841TTXLCLLQSOSUUWM
Content-Transfer-Encoding: 7bit
X-CC-Diagnostic: Header RECEIVED matches "*([0-9]+.[0-9]+.[0-9]+.[0-9]+)*" (0)

------4CJO01DI4FY2841TTXLCLLQSOSUUWM
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

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
 * 5150-5350 MHz: 200 mW (was 20 dBm), NO-OUTDOOR; DFS is kept for
   5250-5350 MHz=2E
 * Replace 5490-5710 MHz with 5650-5725 MHz, 200 mW, NO-OUTDOOR, DFS=2E
   The band is 75 MHz wide, so the maximum bandwidth is 40 MHz=2E
 * Add the sources=2E

Item 18, added by Resolution No=2E 2 of 24 January 2019, also lists
5785-5875 MHz, but only for use in Minsk during the II European Games
2019, so it is not included=2E

Signed-off-by: Valery Belousov <support@rfareas=2Ecom>
---
Found while cross-checking wireless-regdb against the national acts for th=
e
RFAREAS Wi-Fi regulatory map (https://rfareas=2Ecom/blog/tools/wifimap/)=
=2E

 db=2Etxt | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/db=2Etxt b/db=2Etxt
index 43dc0b3=2E=2Ee416c54 100644
--- a/db=2Etxt
+++ b/db=2Etxt
@@ -386,11 +386,21 @@ country BW: DFS-ETSI
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
 country BY: DFS-ETSI
-	(2402 - 2482 @ 40), (20)
-	(5170 - 5250 @ 80), (20), AUTO-BW
-	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
-	(5490 - 5710 @ 160), (27), DFS
+	(2400 - 2483=2E5 @ 40), (100 mW), NO-OUTDOOR
+	(5150 - 5250 @ 80), (200 mW), NO-OUTDOOR, AUTO-BW
+	(5250 - 5350 @ 80), (200 mW), NO-OUTDOOR, DFS, AUTO-BW
+	(5650 - 5725 @ 40), (200 mW), NO-OUTDOOR, DFS
=20
 country BZ: DFS-JP
 	(2402 - 2482 @ 40), (30)
--=20
2=2E43=2E0


------4CJO01DI4FY2841TTXLCLLQSOSUUWM
Content-Type: text/x-diff;
 name=wireless-regdb-BY.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename=wireless-regdb-BY.patch;
 size=2966

RnJvbSA0ODhhODY4Nzk5NjYxZDZmNThkMmRjZGVkOTZkNjhlMDcwYzNlYTk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWYWxlcnkgQmVsb3Vzb3YgPHN1cHBvcnRAcmZhcmVhcy5jb20+
CkRhdGU6IFN1biwgMjIgTm92IDIwMjYgMTc6NDc6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
aXJlbGVzcy1yZWdkYjogVXBkYXRlIHJlZ3VsYXRvcnkgaW5mbyBmb3IgQmVsYXJ1cyAoQlkpCgpU
aGUgQlkgZW50cnkgaGFzIG5vIHNvdXJjZSBhbmQgYWxsb3dzIDU0OTAtNTcxMCBNSHogYXQgMjcg
ZEJtLCB3aGljaAppcyBub3QgcGVybWl0dGVkIGZvciBsaWNlbmNlLWV4ZW1wdCB1c2UgaW4gQmVs
YXJ1cy4KCkxpY2VuY2UtZXhlbXB0IFdpLUZpIGlzIHNldCBvdXQgaW4gUmVzb2x1dGlvbiBOby4g
OSBvZiB0aGUgTWluaXN0cnkKb2YgQ29tbXVuaWNhdGlvbnMgYW5kIEluZm9ybWF0aXphdGlvbiBv
ZiAxIEp1bHkgMjAxMywgdGhlIGxpc3Qgb2YgcmFkaW8KZXF1aXBtZW50IG9wZXJhdGVkIHdpdGhv
dXQgYSBmcmVxdWVuY3kgYXNzaWdubWVudCBwZXJtaXQuIEl0ZW1zIDcgYW5kIDgKd2VyZSByZXBs
YWNlZCBieSBSZXNvbHV0aW9uIE5vLiAxMyBvZiAyOSBBdWd1c3QgMjAxNjsgUmVzb2x1dGlvbiBO
by4gMQpvZiAxMCBKYW51YXJ5IDIwMTggY2hhbmdlZCAib3V0cHV0IHBvd2VyIiBpbiBpdGVtIDcg
dG8gImUuaS5yLnAuIi4KQWxsIHRocmVlIGFjdHMgYXJlIHB1Ymxpc2hlZCBvbiB0aGUgTmF0aW9u
YWwgTGVnYWwgSW50ZXJuZXQgUG9ydGFsCnByYXZvLmJ5LgoKTGltaXRzIGFzIHN0YXRlZCBpbiB0
aGUgcmVzb2x1dGlvbjoKICBpdGVtIDcsIDI0MDAtMjQ4My41IE1IejogMTAwIG1XIGUuaS5yLnAu
CiAgaXRlbSA4LCA1MTUwLTUzNTAgTUh6IGFuZCA1NjUwLTU3MjUgTUh6OiAyMDAgbVcgZS5pLnIu
cC4KQm90aCBpdGVtczogSUVFRSA4MDIuMTEgZXF1aXBtZW50IGluc3RhbGxlZCBpbnNpZGUgYnVp
bGRpbmdzLApzdHJ1Y3R1cmVzIGFuZCB2ZWhpY2xlcywgbm90IHVzaW5nIGFudGVubmFzIGluc3Rh
bGxlZCBvdXRzaWRlIHRoZW0uCgpDaGFuZ2VzOgogKiAyLjQgR0h6OiAyNDAwLTI0ODMuNSBNSHos
IDEwMCBtVywgTk8tT1VURE9PUi4KICogNTE1MC01MzUwIE1IejogMjAwIG1XICh3YXMgMjAgZEJt
KSwgTk8tT1VURE9PUjsgREZTIGlzIGtlcHQgZm9yCiAgIDUyNTAtNTM1MCBNSHouCiAqIFJlcGxh
Y2UgNTQ5MC01NzEwIE1IeiB3aXRoIDU2NTAtNTcyNSBNSHosIDIwMCBtVywgTk8tT1VURE9PUiwg
REZTLgogICBUaGUgYmFuZCBpcyA3NSBNSHogd2lkZSwgc28gdGhlIG1heGltdW0gYmFuZHdpZHRo
IGlzIDQwIE1Iei4KICogQWRkIHRoZSBzb3VyY2VzLgoKSXRlbSAxOCwgYWRkZWQgYnkgUmVzb2x1
dGlvbiBOby4gMiBvZiAyNCBKYW51YXJ5IDIwMTksIGFsc28gbGlzdHMKNTc4NS01ODc1IE1Ieiwg
YnV0IG9ubHkgZm9yIHVzZSBpbiBNaW5zayBkdXJpbmcgdGhlIElJIEV1cm9wZWFuIEdhbWVzCjIw
MTksIHNvIGl0IGlzIG5vdCBpbmNsdWRlZC4KClNpZ25lZC1vZmYtYnk6IFZhbGVyeSBCZWxvdXNv
diA8c3VwcG9ydEByZmFyZWFzLmNvbT4KLS0tCkZvdW5kIHdoaWxlIGNyb3NzLWNoZWNraW5nIHdp
cmVsZXNzLXJlZ2RiIGFnYWluc3QgdGhlIG5hdGlvbmFsIGFjdHMgZm9yIHRoZQpSRkFSRUFTIFdp
LUZpIHJlZ3VsYXRvcnkgbWFwIChodHRwczovL3JmYXJlYXMuY29tL2Jsb2cvdG9vbHMvd2lmaW1h
cC8pLgoKIGRiLnR4dCB8IDE4ICsrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZGIudHh0IGIvZGIu
dHh0CmluZGV4IDQzZGMwYjMuLmU0MTZjNTQgMTAwNjQ0Ci0tLSBhL2RiLnR4dAorKysgYi9kYi50
eHQKQEAgLTM4NiwxMSArMzg2LDIxIEBAIGNvdW50cnkgQlc6IERGUy1FVFNJCiAJKDU0NzAgLSA1
NzI1IEAgMTYwKSwgKDI1MCBtVyksIERGUwogCSg1NzI1IC0gNTg1MCBAIDgwKSwgKDI0KSwgREZT
CiAKKyMgU291cmNlOgorIyBSZXNvbHV0aW9uIG9mIHRoZSBNaW5pc3RyeSBvZiBDb21tdW5pY2F0
aW9ucyBhbmQgSW5mb3JtYXRpemF0aW9uIE5vLiA5CisjIG9mIDEgSnVseSAyMDEzIChyYWRpbyBl
cXVpcG1lbnQgb3BlcmF0ZWQgd2l0aG91dCBhIGZyZXF1ZW5jeSBhc3NpZ25tZW50CisjIHBlcm1p
dCksIGl0ZW1zIDcgYW5kIDgsIGFzIGFtZW5kZWQgYnkgUmVzb2x1dGlvbiBOby4gMTMgb2YgMjkg
QXVndXN0IDIwMTYKKyMgYW5kIFJlc29sdXRpb24gTm8uIDEgb2YgMTAgSmFudWFyeSAyMDE4Ogor
IyBodHRwczovL3ByYXZvLmJ5L2RvY3VtZW50Lz9ndWlkPTM5NjEmcDA9VzIxMzI3NzIwCisjIGh0
dHBzOi8vcHJhdm8uYnkvZG9jdW1lbnQvP2d1aWQ9Mzk2MSZwMD1XMjE2MzEyNjAKKyMgaHR0cHM6
Ly9wcmF2by5ieS9kb2N1bWVudC8/Z3VpZD0zOTYxJnAwPVcyMTgzMjczNworIyBCb3RoIGl0ZW1z
IGFsbG93IHVzZSBvbmx5IGluc2lkZSBidWlsZGluZ3MsIHN0cnVjdHVyZXMgYW5kIHZlaGljbGVz
LAorIyB3aXRob3V0IGFudGVubmFzIG91dHNpZGUgdGhlbS4KIGNvdW50cnkgQlk6IERGUy1FVFNJ
Ci0JKDI0MDIgLSAyNDgyIEAgNDApLCAoMjApCi0JKDUxNzAgLSA1MjUwIEAgODApLCAoMjApLCBB
VVRPLUJXCi0JKDUyNTAgLSA1MzMwIEAgODApLCAoMjApLCBERlMsIEFVVE8tQlcKLQkoNTQ5MCAt
IDU3MTAgQCAxNjApLCAoMjcpLCBERlMKKwkoMjQwMCAtIDI0ODMuNSBAIDQwKSwgKDEwMCBtVyks
IE5PLU9VVERPT1IKKwkoNTE1MCAtIDUyNTAgQCA4MCksICgyMDAgbVcpLCBOTy1PVVRET09SLCBB
VVRPLUJXCisJKDUyNTAgLSA1MzUwIEAgODApLCAoMjAwIG1XKSwgTk8tT1VURE9PUiwgREZTLCBB
VVRPLUJXCisJKDU2NTAgLSA1NzI1IEAgNDApLCAoMjAwIG1XKSwgTk8tT1VURE9PUiwgREZTCiAK
IGNvdW50cnkgQlo6IERGUy1KUAogCSgyNDAyIC0gMjQ4MiBAIDQwKSwgKDMwKQotLSAKMi40My4w
Cgo=

------4CJO01DI4FY2841TTXLCLLQSOSUUWM--
