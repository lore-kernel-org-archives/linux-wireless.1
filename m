Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720274;
	b=iKTCT29lb6eaRIwKZfusjZBkIWic/VqVmbE+3eKLc8Kom3pITpy7wu1i+NiM/Hg5aKUE
	 A6esl3MzyXZtKgOONEL8hekomVfAdz/hqMxzVcstY1CYFFdY/TGbr1m5bOFj1vhG36U44
	 lX/Nd6CUV8lunrvT19hJpeAqE9BHLBEsbLLuz+SuHxjDAx3Pdpx0LfWw4Kn4Rn/l+AbDU
	 RuickXQnjsLiWwM/tdYWSelmR3998JCbyUmp8ygEc9JQfqvwOUmyZXE+U+r6Q0kQeRFiZ
	 BzD9QTa2vnAearrXbbzSvGtAnzGJmTeFV5nRNSuiXxgbPHQ67cOREAnyyFE1l3XSy+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720274;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:From:
	 Message-ID:TLS-Required:Subject:To:Cc:In-Reply-To:References;
	bh=+d3GTXuhpbouvL/zk1/ZRG4uPzZeStuAovx+2OZ0fcc=;
	b=YgvHYpHM9l2VUWqCeZMb+ymVDzhysj7ZtviqgX+XW2Xx7xT4FxH9GaOwA/itAadY5GZk
	 Eqdo8AxPu9MxM7I02A5h50SibGYZVg114BqkNhPZn1Q2iPLRbpszzak6vzTX0Ee0uxn9Z
	 6w3Q/7QAFg/jQWw+Y2bnopwOI6gG+ZuhEyHHerB6xe5I3dx07MTi+4K6qC1N/KUJZf0ID
	 GsKGAEu+JT94J0PPkizaqu9p26HsiO5zoozoxmtWhq1WvoXZYVp1pI19+0ovZpkpa5akw
	 6yvsg7NxsYUs6xX1PLwMGCOxVQwZ8+dOodqgYIVtlKKnKmuQVVJzN8dY1cp1QDV+0+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HrRAeAnG;
	arc=none smtp.remote-ip=91.218.175.145
Received: from mta0.migadu.com (out-145.mta0.migadu.com [91.218.175.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C697606A32C
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 19:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C697606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HrRAeAnG
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pNI3UIfieVMc9jld4gYH3c96wVnEEwLGETvvvG9iUSI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795720271; v=1; x=1796325071;
 b=HrRAeAnG+GDyrhxDqJvfE1TwMGNlcCS0ZQdjCAfAideIoiqYlXNVw+JpaaKqe/I94r+kQCF0
 Xnzy7horfojPTZBhLdvREH9HGJ8OCO4lp97Kdt4dJ53FkICBnO6uJ3ttU8ljQsj83WTx35899mN
 LEg1Iq4fAQT7Syd0Hi99ajkI=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9b29a9c72b8184d5;
	Thu, 26 Nov 2026 19:11:11 +0000
X-Mizu-Trace-ID: 9b29a9c72b8184d5
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 26 Nov 2026 19:11:08 +0000
Content-Type: multipart/mixed;
 boundary="04ff767a-04fa-43e4-ae12-b3fe408a47be-1"
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <41ae89e5a8328124062eea53eab2fc49d6114a56@linux.dev>
TLS-Required: No
Subject: Re: wifi: rtw88: usb: AP sends no beacons after monitor capture on
 the same phy
To: martin@rfdeck.de
Cc: linux-wireless@vger.kernel.org, "Ping-Ke Shih" <pkshih@realtek.com>
In-Reply-To: <20261126161801.Horde.EPNAvNvUumt6-YVgeu2ZpuH@mail.your-server.de>
References: <20261124144427.Horde.qQ_UTCx-6LmjjeS1bojTj8-@mail.your-server.de>
 <D34D5E6B-B159-4F34-92D8-4264024D3319@linux.dev>
 <20261126081256.Horde.ilxldEFeRo6UQJajd_7Nd6S@mail.your-server.de>
 <a0827be820914280cca81b32b495cda655a87fb4@linux.dev>
 <20261126161801.Horde.EPNAvNvUumt6-YVgeu2ZpuH@mail.your-server.de>

--04ff767a-04fa-43e4-ae12-b3fe408a47be-1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Thanks for running these. My thoughts are below.

On November 26, 2026 4:18:01 PM GMT+01:00, <martin@rfdeck.de> wrote:

>    monitor up (C1-C5) 117/1/116/   0x71     0/0/0/0/0    0x31
>                       116/116

I think the queue bit explains the repeatable AP2 failure. Stopping AP1
clears BIT_EN_BCNQ_DL. With the monitor up, the device stays running and
the bit is still clear when AP2 starts. The driver uploads the beacon
before setting the bit again. Commit faa2e484b393 fixed another case of
USB devices going silent with this bit cleared during the upload.

[ ... ]

> It returned "OK" every time, and the silent AP2 came back:

The update uploads the beacon again with the bit already set. Could you
try the attached patch with the same fixed channel test, keeping the
monitor up? It sets the bit before the first USB AP beacon upload.
Please count beacons for both APs before running update_beacon.

C2 sent very few beacons on AP1 and again after the update, so the queue
bit alone may not account for that run.

Best regards,
Luka Gejak
--04ff767a-04fa-43e4-ae12-b3fe408a47be-1
Content-Type: text/plain; name="usb-beacon-queue-test.patch"
Content-Disposition: attachment; filename="usb-beacon-queue-test.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnR3ODgvbWFjODAy
MTEuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnR3ODgvbWFjODAyMTEuYwot
LS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVrL3J0dzg4L21hYzgwMjExLmMKKysr
IGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydHc4OC9tYWM4MDIxMS5jCkBAIC00
MjksNyArNDI5LDEzIEBAIHN0YXRpYyB2b2lkIHJ0d19vcHNfYnNzX2luZm9fY2hhbmdlZChz
dHJ1Y3QgaWVlZTgwMjExX2h3ICpodywKIAl9CiAKIAlpZiAoY2hhbmdlZCAmIEJTU19DSEFO
R0VEX0JFQUNPTikgeworCQlpZiAocnR3X2hjaV90eXBlKHJ0d2RldikgPT0gUlRXX0hDSV9U
WVBFX1VTQiAmJgorCQkgICAgdmlmLT50eXBlID09IE5MODAyMTFfSUZUWVBFX0FQICYmIGNv
bmYtPmVuYWJsZV9iZWFjb24gJiYKKwkJICAgIChjaGFuZ2VkICYgQlNTX0NIQU5HRURfQkVB
Q09OX0VOQUJMRUQpKQorCQkJcnR3X3dyaXRlMzJfc2V0KHJ0d2RldiwgUkVHX0ZXSFdfVFhR
X0NUUkwsCisJCQkJCUJJVF9FTl9CQ05RX0RMKTsKKwogCQlydHdfc2V0X2R0aW1fcGVyaW9k
KHJ0d2RldiwgY29uZi0+ZHRpbV9wZXJpb2QpOwogCQlydHdfZndfZG93bmxvYWRfcnN2ZF9w
YWdlKHJ0d2Rldik7CiAJCXJ0d19zZW5kX3JzdmRfcGFnZV9oMmMocnR3ZGV2KTsKIAl9Cg==
--04ff767a-04fa-43e4-ae12-b3fe408a47be-1--
