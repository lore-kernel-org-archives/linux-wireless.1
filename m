Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567979;
	b=IT47B57kjf7pMVav5fF63RVFM8ZtYSjps4U5dd5f8v0kHUdLBkXyS/1m0QqRt6k6r3M1
	 vGf5oYd+Jl5wZ3dD3m5Xrqh3QWxGrpGIPauMcf0U6ep776wrN4TCoy2LxvH4yKJSZt5iZ
	 rBzUFXPD8hikK+7UuCuPf2VM7vAY2sgEFCLtSsN1S2eIdXE3EOT2xi+jhgnwiHU9DeZqy
	 L1wwdHu7A6TmQuAnLpatgiuCglGkLGaLH7O4ACFSwuHznqdClyqgpzvBFwg37rwTFZb5P
	 jzmgizC0jJbTXCvVdNd5fAFGZl1qirPpX0+4JSdcW/Mj/Vp3qGLuZpS0nDJTxS/sGQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567979;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=C7SP3gMKFjf9Y9XyQIIQEpHqElRz16AHxWxUSV9GYD0=;
	b=XBlv+yo72TxBix0LyXeIB5Jbsb2zUASow32dV5fxyYn8eErGi+ZZQ9Pl7Wqw5+2dTHHi
	 8ekBfeSO3u6RFrG/Oeswbn+OL1HTCX6g5zhjE9p6F4yB62YPANbASkCPIPtmY/TWJiPpL
	 3+OzV8RCz4j0UnyC55wGAphsZZ8oc6looLgkMbhnseh95qRwM9vNgww2U8o66piurmFw3
	 BaYj7erAG1KFOgF6wzy4KghAdIRC/leQ3Hu4NFVMzR409RMsbpOmQvp9rwBLGq4BbL+OA
	 Nn6nM5GK1r7XsokWsPahFPNcqXcWT64OZp0WMZ2kkLZOe9HkH4cwNPnX0H4fHZJyluA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=H0cPxIew;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C88606A323
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 00:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64C88606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=H0cPxIew
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AP0qr9bB2985731, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795567973; bh=C7SP3gMKFjf9Y9XyQIIQEpHqElRz16AHxWxUSV9GYD0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=H0cPxIewwiKWdpx3FWgCUbR7g2AsEiCrQnmCBFZ368b/EVL3TzIO5n1LL/evMgb+U
	 T8AqOLG8HJXnE4C1EGMsmmKcrEG0xc3vqjWErmXP1KdHr7nLasxED36FTOPDgaWAkM
	 YijYO9dFgl0ezt24kaD0oEXvw6DLdwctpyyl2I0Fp/fPLVKOKAS30oy4iqgaC4ruls
	 1zqsHOK6jmZGYBOnS2fPK8gPhmAAHUbHSc0Y0j6t3SquTtHU2cOD6boJeqQmdYZBj5
	 9W32awFHOSzYZzuIhXk/nDY2O2F7tcmSp1kIWURYTEdnnmpoK7YLavUFrnB48F731K
	 wwPIrC/8wK/zQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AP0qr9bB2985731
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Nov 2026 08:52:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 08:52:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 25 Nov 2026 08:52:53 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: "ofear123@gmail.com" <ofear123@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH RFC rtw-next] wifi: rtw89: coex: share air time with BT
 A2DP on 5GHz (shared antenna)
Thread-Topic: [PATCH RFC rtw-next] wifi: rtw89: coex: share air time with BT
 A2DP on 5GHz (shared antenna)
Thread-Index: AQHdfEXxujWS169FZkKrrjYg29HfELc99Y9A
Date: Wed, 25 Nov 2026 00:52:53 +0000
Message-ID: <f48d78363c1f4060b79fa5c097601cd4@realtek.com>
References: <20261124-rtw-next-v1-1-8f720c5cc759@gmail.com>
In-Reply-To: <20261124-rtw-next-v1-1-8f720c5cc759@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

T2ZpciBIYWRhZCB2aWEgQjQgUmVsYXkgPGRldm51bGwrb2ZlYXIxMjMuZ21haWwuY29tQGtlcm5l
bC5vcmc+IHdyb3RlOg0KPiBTZW50IGFzIFJGQzogaXMgYW4gb3B0LWluIHBhcmFtZXRlciBhY2Nl
cHRhYmxlLCBvciBzaG91bGQgdGhpcyBiZQ0KPiB0aGUgZGVmYXVsdCBmb3Igc2hhcmVkLWFudGVu
bmEgUlRMODg1MkMsIG9yIGlzIGl0IGJldHRlciBzb2x2ZWQgaW4NCj4gZmlybXdhcmU/DQoNClNo
b3VsZCBhdm9pZCB1c2luZyBtb2R1bGUgcGFyYW1ldGVycy4gSSdkIGNvbnN1bHQgQlQtY29leGlz
dGVuY2UgZXhwZXJ0DQp0byBzZWUgaWYgaGUgaGFzIGJldHRlciBzb2x1dGlvbi4gDQoNClBpbmct
S2UNCg0K
