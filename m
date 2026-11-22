Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.177.160.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371157;
	b=DZu91F64+gjm4Oz6iPtjdocqNHkqNdrbyrQwV+jPdf3k2tu/8DibjO1gUMrbgtGo+3W5
	 lBA53VBMcCFtQqN0tOpYzB227NWjRPrkB2TiUd2qPpuPc+vWy5Pb63yuZ5k07hN/k0ch1
	 tsMOjwrUcyNZ6rKtimgofwMlveEoD3NeYZ2y+65MqHc3fhGrHUvwzFkJEDyqaXpQ0XiqC
	 A5/k4YoNisGtUUQc+Luyfo0yzUwf9V1m7waQ8o6UhuW/L6hq4+ka28txTWjk55e6oOI0G
	 7Eu9Phc9VeQkt8Q3D7aiGNCDK61izXVxWP9B1oyZdH8be4PC7bwrU0Q1ZEtX64vN8Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371157;
	h=DMARC-Filter:Received:Received:Received:Received:Received:Received:
	 Date:From:To:CC:Subject:User-Agent:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-CC-Diagnostic;
	bh=aBuBxDhQF9UaS1I/3ToKMUlfTy1uIH0wHb87G6Bl9Sw=;
	b=AsIk7hqgspOC1eP0P9F6S9X7PGaIsjxXABsx4msumQ8vDyrmAxz8b7XY69WmAqmv3i3E
	 b3O20WTamh9fAkfBNmOglnr9ZMlhrOavy0NznWCtwFOVEMc/3DtiwBU+YiGr+iJYgJQfj
	 hPcDciIsGl8eF3Ok+ISzJDLArVVP2dM+40DYMC+XrUN2TU7TPH0TDjgdBakArwtjUgW6J
	 AsIj0Tk+VzUG7GtCc78wtcu/cze24c2oLoIa61shgemoLkhBdNls4aOyvn7tIGbayyNpH
	 rd7GWIjIlBmlVUrmpnVm+Ocq0AWT9F+Uy+G8hjjXQWb2OlpTzUOKiW3VIddO4IZzzQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfareas.com;
	spf=pass smtp.mailfrom=rfareas.com;
	arc=none smtp.remote-ip=81.177.160.4
Received: from s24fifth.in-solve.ru (s24fifth.in-solve.ru [81.177.160.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E62E606A336
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 18:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E62E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfareas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfareas.com
Received: from Spooler by s24fifth.in-solve.ru (Mercury/32 v4.52) ID MO00041B;
    22 Nov 2026 21:12:35 +0300
Received: from spooler by mail-aux1.in-solve.hidden (Mercury/32 v4.52); 22 Nov 2026 21:12:27 +0300
Received: from mail-s22 (10.0.1.22) by mail-s24-t.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG00041A;
   22 Nov 2026 21:12:26 +0300
Received: from Spooler by mail-s22 (Mercury/32 v4.52) ID MO00004A;
  22 Nov 2026 21:12:23 +0300
Received: from spooler by mail-s22-aux3.in-solve.hidden (Mercury/32 v4.52); 22 Nov 2026 21:12:22 +0300
Received: from ehlo.thunderbird.net (128.204.79.33) by mail-s22.1gb.ru (Mercury/32 v4.52) with ESMTP ID MG000049;
   22 Nov 2026 21:12:19 +0300
Date: Sun, 22 Nov 2026 21:12:21 +0300
From: RFAREAS Support <support@rfareas.com>
To: linux-wireless@vger.kernel.org
CC: wireless-regdb@lists.infradead.org, wens@kernel.org
Subject: [PATCH] wireless-regdb: Update regulatory info for Kazakhstan (KZ)
User-Agent: K-9 Mail for Android
Message-ID: <7C3E3534-43A6-4D85-BAA7-9BC337438EEB@rfareas.com>
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
 boundary=----FCEPW6QD6ITI3HZAAVBO0BM4KBB1DI
Content-Transfer-Encoding: 7bit
X-CC-Diagnostic: Header RECEIVED matches "*([0-9]+.[0-9]+.[0-9]+.[0-9]+)*" (0)

------FCEPW6QD6ITI3HZAAVBO0BM4KBB1DI
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

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

Changes:
 * 5250-5350 MHz: raise the limit from 20 dBm (100 mW) to 200 mW;
   the item gives 200 mW for the whole 5150-5350 MHz range=2E
 * 57-66 GHz: add NO-OUTDOOR ("only for use inside a building")=2E
 * Update the source links to the current consolidated Rules and the
   amending order, using https=2E

The other rules already match the item=2E The item does not mention
DFS; the existing DFS flags are kept=2E The power spectral density
limits cannot be expressed in db=2Etxt=2E

Signed-off-by: Valery Belousov <support@rfareas=2Ecom>
---
Found while cross-checking wireless-regdb against the national acts for th=
e
RFAREAS Wi-Fi regulatory map (https://rfareas=2Ecom/blog/tools/wifimap/)=
=2E

 db=2Etxt | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/db=2Etxt b/db=2Etxt
index 43dc0b3=2E=2E3eb02d2 100644
--- a/db=2Etxt
+++ b/db=2Etxt
@@ -1194,16 +1194,21 @@ country KY: DFS-FCC
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
:
+# https://adilet=2Ezan=2Ekz/rus/docs/V1500010375
 country KZ: DFS-ETSI
 	(2400 - 2483=2E5 @ 40), (100 mW)
 	(5150 - 5250 @ 80), (200 mW), NO-OUTDOOR, AUTO-BW
-	(5250 - 5350 @ 80), (20), NO-OUTDOOR, DFS, AUTO-BW
+	(5250 - 5350 @ 80), (200 mW), NO-OUTDOOR, DFS, AUTO-BW
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


------FCEPW6QD6ITI3HZAAVBO0BM4KBB1DI
Content-Type: text/x-diff;
 name=wireless-regdb-KZ.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename=wireless-regdb-KZ.patch;
 size=3148

RnJvbSAzNWI1ZmJlNmU5MzE2ZDA5YmEwZTdjZDY3M2M5NjI0N2Y0ZGYyZWRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWYWxlcnkgQmVsb3Vzb3YgPHN1cHBvcnRAcmZhcmVhcy5jb20+
CkRhdGU6IFN1biwgMjIgTm92IDIwMjYgMTc6NDc6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
aXJlbGVzcy1yZWdkYjogVXBkYXRlIHJlZ3VsYXRvcnkgaW5mbyBmb3IgS2F6YWtoc3RhbiAoS1op
CgpUaGUgS1ogZW50cnkgY2l0ZXMgdGhlIDIwMTUgdmVyc2lvbnMgb2YgdGhlIFJ1bGVzIGZvciB0
aGUgYXNzaWdubWVudApvZiBmcmVxdWVuY3kgYmFuZHMgKE9yZGVyIE5vLiAzNCBvZiAyMSBKYW51
YXJ5IDIwMTUpLiBJdGVtIDI0ICJXQVMvUkxBTiIKb2YgQW5uZXggMSB0byB0aGVzZSBSdWxlcywg
dGhlIGxpc3Qgb2YgcmFkaW8gZXF1aXBtZW50IHRoYXQgbWF5IGJlCm9wZXJhdGVkIHdpdGhvdXQg
YSBwZXJtaXQsIHdhcyByZXBsYWNlZCBieSBPcmRlciBOby4gNTY0L05LIG9mIHRoZQpNaW5pc3Ry
eSBvZiBEaWdpdGFsIERldmVsb3BtZW50LCBJbm5vdmF0aW9uIGFuZCBBZXJvc3BhY2UgSW5kdXN0
cnkgb2YKMTkgU2VwdGVtYmVyIDIwMjQgKHJlZ2lzdGVyZWQgd2l0aCB0aGUgTWluaXN0cnkgb2Yg
SnVzdGljZSB1bmRlcgpOby4gMzUxMDAgb24gMjMgU2VwdGVtYmVyIDIwMjQsIGluIGZvcmNlIHRl
biBkYXlzIGFmdGVyIGl0cyBmaXJzdApvZmZpY2lhbCBwdWJsaWNhdGlvbikuIFRoZSBjb25zb2xp
ZGF0ZWQgdGV4dCBvZiB0aGUgUnVsZXMgb24gdGhlCm9mZmljaWFsIGxlZ2FsIHBvcnRhbCBhZGls
ZXQuemFuLmt6IGNvbnRhaW5zIHRoZSBzYW1lIGl0ZW0uCgpMaW1pdHMgYXMgc3RhdGVkIGluIGl0
ZW0gMjQgKGFsbCBlLmkuci5wLik6CiAgMjQwMC0yNDgzLjUgTUh6OiAxMDAgbVcsIDEwIG1XL01I
eiBmb3Igd2lkZWJhbmQgbW9kdWxhdGlvbnMKICA1MTUwLTUzNTAgTUh6OiAgIDIwMCBtVywgMTAg
bVcvTUh6LCBpbmRvb3IgdXNlIG9ubHkKICA1NDcwLTU3MjUgTUh6OiAgIDEwMCBtVywgMTAgbVcv
TUh6LCBpbmRvb3IgdXNlIG9ubHkKICA1NzI1LTU4NTAgTUh6OiAgIDEwMCBtVywgMTAgbVcvTUh6
LCBpbmRvb3IgdXNlIG9ubHkKICA1OTI1LTY0MjUgTUh6OiAgIDIwMCBtVywgMTAgbVcvTUh6LCBp
bmRvb3IgdXNlIG9ubHkKICA1Ny02NiBHSHo6ICAgICAgIDQwIGRCbSwgMTMgZEJtL01IeiBtZWFu
LCBpbmRvb3IgdXNlIG9ubHkKCkNoYW5nZXM6CiAqIDUyNTAtNTM1MCBNSHo6IHJhaXNlIHRoZSBs
aW1pdCBmcm9tIDIwIGRCbSAoMTAwIG1XKSB0byAyMDAgbVc7CiAgIHRoZSBpdGVtIGdpdmVzIDIw
MCBtVyBmb3IgdGhlIHdob2xlIDUxNTAtNTM1MCBNSHogcmFuZ2UuCiAqIDU3LTY2IEdIejogYWRk
IE5PLU9VVERPT1IgKCJvbmx5IGZvciB1c2UgaW5zaWRlIGEgYnVpbGRpbmciKS4KICogVXBkYXRl
IHRoZSBzb3VyY2UgbGlua3MgdG8gdGhlIGN1cnJlbnQgY29uc29saWRhdGVkIFJ1bGVzIGFuZCB0
aGUKICAgYW1lbmRpbmcgb3JkZXIsIHVzaW5nIGh0dHBzLgoKVGhlIG90aGVyIHJ1bGVzIGFscmVh
ZHkgbWF0Y2ggdGhlIGl0ZW0uIFRoZSBpdGVtIGRvZXMgbm90IG1lbnRpb24KREZTOyB0aGUgZXhp
c3RpbmcgREZTIGZsYWdzIGFyZSBrZXB0LiBUaGUgcG93ZXIgc3BlY3RyYWwgZGVuc2l0eQpsaW1p
dHMgY2Fubm90IGJlIGV4cHJlc3NlZCBpbiBkYi50eHQuCgpTaWduZWQtb2ZmLWJ5OiBWYWxlcnkg
QmVsb3Vzb3YgPHN1cHBvcnRAcmZhcmVhcy5jb20+Ci0tLQpGb3VuZCB3aGlsZSBjcm9zcy1jaGVj
a2luZyB3aXJlbGVzcy1yZWdkYiBhZ2FpbnN0IHRoZSBuYXRpb25hbCBhY3RzIGZvciB0aGUKUkZB
UkVBUyBXaS1GaSByZWd1bGF0b3J5IG1hcCAoaHR0cHM6Ly9yZmFyZWFzLmNvbS9ibG9nL3Rvb2xz
L3dpZmltYXAvKS4KCiBkYi50eHQgfCAxMyArKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RiLnR4dCBiL2Ri
LnR4dAppbmRleCA0M2RjMGIzLi4zZWIwMmQyIDEwMDY0NAotLS0gYS9kYi50eHQKKysrIGIvZGIu
dHh0CkBAIC0xMTk0LDE2ICsxMTk0LDIxIEBAIGNvdW50cnkgS1k6IERGUy1GQ0MKIAkoNTcwMDAg
LSA3MTAwMCBAIDIxNjApLCAoNDApCiAKICMgU291cmNlOgotIyBodHRwOi8vYWRpbGV0Lnphbi5r
ei9ydXMvZG9jcy9WMTUwMDAxMDczMAotIyBodHRwOi8vYWRpbGV0Lnphbi5rei9ydXMvZG9jcy9W
MTUwMDAxMDM3NQorIyBSdWxlcyBmb3IgdGhlIGFzc2lnbm1lbnQgb2YgZnJlcXVlbmN5IGJhbmRz
IC4uLiAoT3JkZXIgTm8uIDM0IG9mCisjIDIxIEphbnVhcnkgMjAxNSksIEFubmV4IDEgKHJhZGlv
IGVxdWlwbWVudCB0aGF0IG5lZWRzIG5vIHBlcm1pdCksCisjIGl0ZW0gMjQgIldBUy9STEFOIiwg
YXMgYW1lbmRlZCBieSBPcmRlciBOby4gNTY0L05LIG9mIDE5IFNlcHRlbWJlciAyMDI0OgorIyBo
dHRwczovL2FkaWxldC56YW4ua3ovcnVzL2RvY3MvVjE1MDAwMTA3MzAKKyMgaHR0cHM6Ly9hZGls
ZXQuemFuLmt6L3J1cy9kb2NzL1YyNDAwMDM1MTAwCisjIFRhYmxlIG9mIGZyZXF1ZW5jeSBiYW5k
IGFsbG9jYXRpb25zIChPcmRlciBOby4gMjIgb2YgMjAgSmFudWFyeSAyMDE1KToKKyMgaHR0cHM6
Ly9hZGlsZXQuemFuLmt6L3J1cy9kb2NzL1YxNTAwMDEwMzc1CiBjb3VudHJ5IEtaOiBERlMtRVRT
SQogCSgyNDAwIC0gMjQ4My41IEAgNDApLCAoMTAwIG1XKQogCSg1MTUwIC0gNTI1MCBAIDgwKSwg
KDIwMCBtVyksIE5PLU9VVERPT1IsIEFVVE8tQlcKLQkoNTI1MCAtIDUzNTAgQCA4MCksICgyMCks
IE5PLU9VVERPT1IsIERGUywgQVVUTy1CVworCSg1MjUwIC0gNTM1MCBAIDgwKSwgKDIwMCBtVyks
IE5PLU9VVERPT1IsIERGUywgQVVUTy1CVwogCSg1NDcwIC0gNTcyNSBAIDE2MCksICgxMDAgbVcp
LCBOTy1PVVRET09SLCBERlMKIAkoNTcyNSAtIDU4NTAgQCA4MCksICgxMDAgbVcpLCBOTy1PVVRE
T09SCiAJKDU5MjUgLSA2NDI1IEAgMzIwKSwgKDIwMCBtVyksIE5PLU9VVERPT1IKLQkoNTcwMDAg
LSA2NjAwMCBAIDIxNjApLCAoNDApCisJKDU3MDAwIC0gNjYwMDAgQCAyMTYwKSwgKDQwKSwgTk8t
T1VURE9PUgogCiBjb3VudHJ5IExCOiBERlMtRkNDCiAJKDI0MDIgLSAyNDgyIEAgNDApLCAoMjAp
Ci0tIAoyLjQzLjAKCg==

------FCEPW6QD6ITI3HZAAVBO0BM4KBB1DI--
