Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575785;
	b=4eoDWqqshN9AMCRQGG5V3+3IpQ9JYkqaOuCi4a9F9ugEgbZNDw3/BjSzm2AOimEr77Tl
	 bvGg5Y2rN2kz5unBMxCARWGm/YJrg/e34B8imu178NKrRbsq6ddxMQpN1G7AbcohswlSq
	 ACX6RQs9YBlCLKp+VAOanG114kdPmD9TmpchUFMN4fwRqRGiCUyR7/pcCso3fbvqm+3jd
	 rG3LgbMACnWYZEDZIW+wsroYCKjAJluXWGZW3TWwOkXOFSaxvWBH6JNxxXig2Z2PwzEMF
	 iLhvkTdx0hXPpaHbvMIxCTCRFPsk3shKmVoMLMYl0z/CpG/o1B3e/fSi1k0SJlhooXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575785;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=4E/3lMnZ2bQtn2ReozNd+fkmaoa+jVe22n0rHxFxZz0=;
	b=0bwcnHx6xcCYk4kRdxo7zu+ZyMUEwQ3w9/LgQB6ZBQwY/QCk5psyo7ChVvuyL4XwQzWM
	 Z3KCYmSCW6YbAv0Ch/774xPcW5l0nr/3c9kS3OnK6GPp8hxfVPyhET9Gb4+O04FxmZQhD
	 BTq8jVVEbHLmkcZhRRliQZ0VNPCDZE527jMxv8e260pijSTPD6loIKrF+KtJGCzsbOkZh
	 NmUITROf2NBI+Rx54VDRPprgsFLhkcuYmyvbfmfI9wW85iQkn8BbS1vTZ8O5bZc9Ah9hA
	 eesr8SHuJPR4Y4zkSRlaFWiuqhQHwLzF4Y2rmzLstReJSufw2PiVfSVaxPntdtFewaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=oeVOouaz;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8778606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 03:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8778606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=oeVOouaz
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AP32tC023112097, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795575775; bh=4E/3lMnZ2bQtn2ReozNd+fkmaoa+jVe22n0rHxFxZz0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=oeVOouazh2e+Brh4oMlYn0kPeYgimeH02r5mt3iMvRjidu34+ewCi7OWeAennd/TU
	 xYKNJdiGpdAVWvlvfzolvke/vph3iNMqBkW9hKxLJokGXsKAk4IRruGRA39pOS4LJa
	 7wx7iy+scALo/pgOdqHCrJ/J5ZAQlGB/8If7dy+V9omPAc7KYVwICkHqavrjFBOmPW
	 RRO2AopZDQlOiSXD2mfAdH1SSreNXw0Cq7PXNfPnUcHEs3FVBI7xheRKGIKhHRpOyj
	 B082Pz+cpqaNRLqPkMIXb4WkKBq6o4P8LqNLqF/JUwJdj7UTtkj0XO86t1dmiD24KK
	 K5dBbyvODuB0w==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AP32tC023112097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Nov 2026 11:02:55 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 11:02:55 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 25 Nov 2026 11:02:55 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: "ofear123@gmail.com" <ofear123@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH RFC rtw-next] wifi: rtw89: coex: share air time with BT
 A2DP on 5GHz (shared antenna)
Thread-Topic: [PATCH RFC rtw-next] wifi: rtw89: coex: share air time with BT
 A2DP on 5GHz (shared antenna)
Thread-Index: AQHdfEXxujWS169FZkKrrjYg29HfELc+GeRA
Date: Wed, 25 Nov 2026 03:02:54 +0000
Message-ID: <ee412770f27147c7839c848657dc5288@realtek.com>
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
bC5vcmc+IHdyb3RlOg0KPiBGcm9tOiBPZmlyIEhhZGFkIDxvZmVhcjEyM0BnbWFpbC5jb20+DQo+
IA0KPiBPbiBSVEw4ODUyQ0Ugd2l0aCBhIHNoYXJlZCBXaUZpL0JUIGFudGVubmEgKGFudF9pc28g
MTAgZEIsIHNlZW4gb24gYQ0KPiBMZW5vdm8gTGVnaW9uIDcgMTZJUlg5LCBzdWJzeXN0ZW0gMTdh
YTo1ODUyKSwgQmx1ZXRvb3RoIEEyRFAgYXVkaW8NCj4gZHJvcHMgb3V0IGZvciAxMDAtNjAwIG1z
IGV2ZXJ5IGZldyBzZWNvbmRzIHdoaWxlIFdpRmkgZG93bmxvYWRzIG9uDQo+IDUgR0h6LiBWaWRl
byBzdHJlYW1pbmcgdHJpZ2dlcnMgaXQ6IHRoZSBwbGF5ZXIgZmV0Y2hlcyBhIGNodW5rIGF0DQo+
IDMtOCBNQi9zIGFib3V0IGV2ZXJ5IDQgc2Vjb25kcy4NCg0KQ2FuIHlvdSBjYXB0dXJlIGFuZCBz
aGFyZSBsb2cgYnkgZHVtcF9idGMuc2ggWzFdIGFuZCBwb2ludCB0aGUgdGltZQ0KYXVkaW8gZHJv
cHMgb3V0Pw0KDQpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Brc2hpaC9ydHcvd2lraS9UaGUtUmVh
bHRlay1XaUZpLWRyaXZlci1ub3RlcyNidC1jb2V4aXN0ZW5jZS1wcm9ibGVtDQoNCg0K
