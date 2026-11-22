Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795305987;
	b=WUSIL3D1t1ecq2UWh7Iz9A1Cc02auNyc698jUsXThPf7wYzzzaVbsiOhHin2crgUNrB8
	 ECCeUrgCHqtoXqSanA07iuaX27viv4HnCUeovyOEoihH8gACQCDo/3kOuRp+Kdff3m0pJ
	 YqKagBVP0pUPZLyknmM1WIP+YwEU7UMbYfkkzDBoUvvkkkS63KvetF3CAopx7bUhkd23G
	 bcjQ7Ke/x8X+skM76OoxzQ3n69boLdj/10oFH5Lh9YgWBpvMqYch8CBIMU+suHieVX8Yl
	 Fzs4txaGEuWHSUZurobha77rpbROWWGIAUSaxXUPBO8e925WYmeppbqC+RspeFkMyvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795305987;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type;
	bh=+ygAcHjKwYZt6gv+LO1NiJjlVE7nOKUZ7es/DwRgpRE=;
	b=yog0CvQOsBo6aG+2HmLS1t8LRkwhUdQdNmCOxCe5K9BbKMceaa+pe7VPsRLQqP/Knref
	 U5PNoWWF9kegDL/6Wtxa4iN9ei7PVJdIwAJJi4oxL7+mY0F0+wKfTfcQ1opqP3YCaHVKy
	 ik7NYbdNf36sFzZg52ncU5FggOsPFV5v2G6xNLRxpIMIyEXQfdsvtJyWIKJe0yrRRWfCt
	 TdjG/rq0+bqdclCO42BGUOrpxt/zWwewjJ9vujZ7QHqz52z1Tkw5VYJExt7wkPW5TYOfD
	 VqBuZCEsFY/rfcePmq7Ska2fx1U4/B6LvapyoWQMFzk8dMWgVCmRUud31tJLd519WBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=zeB9YasO;
	arc=none smtp.remote-ip=109.224.244.31
Received: from mail-24431.protonmail.ch (mail-24431.protonmail.ch [109.224.244.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A33606A32C
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 00:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44A33606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=zeB9YasO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795305985; x=1795565185;
	bh=+ygAcHjKwYZt6gv+LO1NiJjlVE7nOKUZ7es/DwRgpRE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=zeB9YasOlJgPXHyqy+H6pycaS0xted/v9f/arNnUR+5vTgMO2aQgcmwz94Qq741MW
	 CRp8aO312W+CmSkxvwNaKHIUoo1PiSy1egYeWfStd2JWQQulUHYeN9x2UAfq26ezhd
	 AdWdtioGnyVtC8yTAUpsNJ4D3spt016IaAA4yKWsMAV8xi+yVLZItDqTALW5wZ6AGp
	 H+DEsAL1B7atfaJ05tbweYgK6mxcWJ68OzAeJsrlANhwwW0EIWW5ZZsVzcmIHxXB+b
	 Pt3nrd3s9hc5WZDmVcoLa0zirmXlotX1SDmBNeo5MJqIeYrxkE4H0RUMZGDsMs8P3z
	 z8v5QYfWfP/gg==
Date: Sun, 22 Nov 2026 00:06:21 +0000
To: "pkshih@realtek.com" <pkshih@realtek.com>
From: Falconet3 <Falconet3@proton.me>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] wifi: rtw89: fix OOB read past firmware buffer when duplicating elements
Message-ID: <ONBhkh_B7hyKoHNRpjYgxy7da68QOa8cWUqztT-I1nW-KukOKE30FIYFLkX1Tm_TrXlBjse5d-AFRwsyzfxBdMGKvyIEoVsjyZQqxzUkRQk=@proton.me>
Feedback-ID: 48740069:user:proton
X-Pm-Message-ID: 0635a80f4961a221e1b01f4791f9468df6223cb0
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
 boundary="b1=_PKZXEg47bP4vmjaknY9EiYCMjB40SwT4aWAeErJEx8"

--b1=_PKZXEg47bP4vmjaknY9EiYCMjB40SwT4aWAeErJEx8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fix for an OOB read (up to 31 bytes past the firmware buffer) introduced in=
 v7.4-rc1 by the fw-element copy-on-parse rework. Patch attached, applies t=
o v7.4-rc3. Thanks!
--b1=_PKZXEg47bP4vmjaknY9EiYCMjB40SwT4aWAeErJEx8
Content-Type: text/x-patch; name=0001-wifi-rtw89-fix-OOB-read-in-fw-element-dup.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=0001-wifi-rtw89-fix-OOB-read-in-fw-element-dup.patch

RnJvbTogRmFsY29uZXQzIDxGYWxjb25ldDNAcHJvdG9uLm1lPgpEYXRlOiBTYXQsIDIxIE5vdiAy
MDI2IDIxOjAwOjAwICswMDAwClN1YmplY3Q6IFtQQVRDSF0gd2lmaTogcnR3ODk6IGZpeCBPT0Ig
cmVhZCBwYXN0IGZpcm13YXJlIGJ1ZmZlciB3aGVuIGR1cGxpY2F0aW5nIGVsZW1lbnRzCgpTaW5j
ZSB2Ny40LXJjMSwgcnR3ODkgY29waWVzIGZpcm13YXJlIGVsZW1lbnRzIGF0IHBhcnNlIHRpbWUg
c28gdGhlCnN0cnVjdCBmaXJtd2FyZSBjYW4gYmUgcmVsZWFzZWQgYWZ0ZXIgcHJvYmUKKHJ0dzg5
X2Z3X2VsZW1fZHVwX2lmX25lZWRlZCgpLCBmdy5jOjE2OCkuIFRoZSBjb3B5IGxlbmd0aCBpcwpz
aXplb2YoKmVsbSkgKyBsZTMyX3RvX2NwdShlbG0tPnNpemUpICh0aGUgZWxlbWVudCBoZWFkZXIg
aXMgMzIgYnl0ZXMsCmZ3Lmg6NDY0NiksIGJ1dCB0aGUgZWxlbWVudCB3YWxrIGluIF9fcnR3ODlf
ZndfcmVjb2duaXplX2VsZW1lbnRzKCkKb25seSB2YWxpZGF0ZXMgIm9mZnNldCArIGVsbV9zaXpl
IDwgZmlybXdhcmUtPnNpemUiIChmdy5jOjE2NzgpLApvbWl0dGluZyB0aGUgaGVhZGVyIHNpemUu
CgpBIGNyYWZ0ZWQgZmlybXdhcmUgZWxlbWVudCB3aXRoIG9mZnNldCArIGVsbV9zaXplID09IGZp
cm13YXJlLT5zaXplIC0gMQp0aGVyZWZvcmUgcGFzc2VzIHRoZSBjaGVjaywgYW5kIGRldm1fa21l
bWR1cCgpL3ZtYWxsb2MrbWVtY3B5IGluCl9fcnR3ODlfZndfZWxlbV9kdXBfaWZfbmVlZGVkKCkg
KGZ3LmM6MTQxLTE2MCwgY2FsbGVkIGZyb20gZncuYzoxMzYxLAoxNDE3LCAxNTI0LCAxNTM2LCAx
NTYyKSByZWFkcyB1cCB0byBzaXplb2Yoc3RydWN0IHJ0dzg5X2Z3X2VsZW1lbnRfaGRyKS0xCj0g
MzEgYnl0ZXMgcGFzdCB0aGUgZW5kIG9mIGZpcm13YXJlLT5kYXRhLgoKSW1wYWN0OiBoZWFwL3Zt
YWxsb2MgT09CIHJlYWQgb2YgdXAgdG8gMzEgYnl0ZXMgYXQgZHJpdmVyIHByb2JlLApjb3BpZWQg
aW50byBhIHBlcnNpc3RlbnQgZGV2bV8gYnVmZmVyOyBvbiBleGFjdC1zaXplIHZtYWxsb2MgZmly
bXdhcmUKYnVmZmVycyB0aGUgcmVhZCBjYW4gaGl0IHRoZSBndWFyZCBwYWdlIChwcm9iZS10aW1l
IG9vcHMvRG9TKS4KVGhyZWF0IG1vZGVsOiBtYWxpY2lvdXMvcmVwbGFjZWQgZmlybXdhcmUgZmls
ZSAocm9vdCBvciBzdXBwbHkgY2hhaW4pLgpBZmZlY3RzIHY3LjQtcmMxLi52Ny40LXJjMyBvbmx5
IChpbiB2Ny4zLjUgYW5kIGVhcmxpZXIgdGhlIGhhbmRsZXJzCnN0b3JlZCBwb2ludGVycyBpbnRv
IHRoZSBmaXJtd2FyZSBpbnN0ZWFkIG9mIGNvcHlpbmcsIGZ3LmM6MTM0NikuCgpGaXggdGhlIHdh
bGsgdG8gdmFsaWRhdGUgaGVhZGVyICsgYm9keSwgb3ZlcmZsb3ctc2FmZS4KCkZpeCB3YXMgdmVy
aWZpZWQgd2l0aCBnaXQgYXBwbHkgLS1jaGVjayBhZ2FpbnN0IHY3LjQtcmMzOyBub3QKYnVpbGQt
dGVzdGVkIGFuZCBubyByZXByb2R1Y2VyIGF2YWlsYWJsZSBpbiB0aGlzIGVudmlyb25tZW50LgoK
Rml4ZXM6IEZJTEwtSU4tU0hBICgid2lmaTogcnR3ODk6IC4uLiIpCkFzc2lzdGVkLWJ5OiBMTE0g
TWlzdHJhbCBWaWJlClNpZ25lZC1vZmYtYnk6IEZhbGNvbmV0MyA8RmFsY29uZXQzQHByb3Rvbi5t
ZT4KLS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVrL3J0dzg5L2Z3LmMgfCA1ICsrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydHc4OS9mdy5jIGIvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvcmVhbHRlay9ydHc4OS9mdy5jCmluZGV4IDAwMDAwMDAuLjAwMDAwMDAgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnR3ODkvZncuYworKysgYi9k
cml2ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVrL3J0dzg5L2Z3LmMKQEAgLTE2NjgsNiArMTY2OCw3
IEBAIHN0YXRpYyBpbnQgX19ydHc4OV9md19yZWNvZ25pemVfZWxlbWVudHMoc3RydWN0IHJ0dzg5
X2RldiAqcnR3ZGV2LAogCWNvbnN0IHN0cnVjdCBydHc4OV9md19lbGVtZW50X2hhbmRsZXIgKmhh
bmRsZXI7CiAJY29uc3Qgc3RydWN0IHJ0dzg5X2Z3X2VsZW1lbnRfaGRyICpoZHI7CiAJdTMyIGVs
bV9zaXplOwogCXUzMiBlbGVtX2lkOworCXUzMiBlbmQ7CiAJaW50IHJldDsKIApAQCAtMTY3NCw4
ICsxNjc1LDEwIEBAIHN0YXRpYyBpbnQgX19ydHc4OV9md19yZWNvZ25pemVfZWxlbWVudHMoc3Ry
dWN0IHJ0dzg5X2RldiAqcnR3ZGV2LAogCXdoaWxlIChvZmZzZXQgKyBzaXplb2YoKmhkcikgPCBm
aXJtd2FyZS0+c2l6ZSkgewogCQloZHIgPSAoY29uc3Qgc3RydWN0IHJ0dzg5X2Z3X2VsZW1lbnRf
aGRyICopKGZpcm13YXJlLT5kYXRhICsgb2Zmc2V0KTsKIAogCQllbG1fc2l6ZSA9IGxlMzJfdG9f
Y3B1KGhkci0+c2l6ZSk7Ci0JCWlmIChvZmZzZXQgKyBlbG1fc2l6ZSA+PSBmaXJtd2FyZS0+c2l6
ZSkgeworCQlpZiAoY2hlY2tfYWRkX292ZXJmbG93KG9mZnNldCwgKHUzMilzaXplb2YoKmhkciks
ICZlbmQpIHx8CisJCSAgICBjaGVja19hZGRfb3ZlcmZsb3coZW5kLCBlbG1fc2l6ZSwgJmVuZCkg
fHwKKwkJICAgIGVuZCA+IGZpcm13YXJlLT5zaXplKSB7CiAJCQlydHc4OV93YXJuKHJ0d2Rldiwg
ImZpcm13YXJlIGVsZW1lbnQgc2l6ZSBleGNlZWRzXG4iKTsKIAkJCWJyZWFrOwogCQl9Ci0tIAoy
LjUzLjAK

--b1=_PKZXEg47bP4vmjaknY9EiYCMjB40SwT4aWAeErJEx8--

