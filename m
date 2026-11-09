Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794190224;
	b=F3hHP8NB/Pa7HaU7Qvrezw+ADw50lSozJXZPRvZ28EfWNZuRXoAO2+pAurK5Ae+sNMJ4
	 2IDpmna4a1YKxwmv8/FBktYpgoAE6+Ybvd0XSRADxSBGzHGz7T6xci68qd1+Bi2dqA7J1
	 IDm6N+wQxYT+DmHLVdrxaK7rPKKT4utmkY+k5dQUMHQFq31nTD/mFdbyL4dAmquNJUyCK
	 06SCLMz8OzJ1+yhNgTH/BqYNtOa6EohAWI//ffX/YiQnkmxtD9oHWkrloXGifBZySEmuI
	 rjPWXQTN/GIj4YtiEcyJTsqGzuKUi6vDsOoLvAZiRVENbRIdP1/muKl/eNvoQi0q6ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190224;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=ROoS+Z6inS410WDiSLd3zANYD+WLf1f6jX9pUrXjKkI=;
	b=4q29l9jy+LfMWituSybc2H8nIjL5t+8x/8KNAEeU46MTOufX7GzEjhKLWEDSEiE40KSo
	 g2SGkX80PabGJhyxJaDaXZ3YxzBDLTy3qAsK1SI0iaWbYzrcivYC3YRLvGNUbddFBQyu6
	 R5Y20905oNKj5jPGzDbcvuZGtZY153HnHAadsir5zS3uIuSdqBofgJnxKbQrGgtLwVma5
	 bOSbwYZKxqS/88/gqghboK6kYJnWlP/GQoayHPtyq/k9k1L9cvcR42UTJRlHxm9mMeybd
	 aycSuNC/WK/TuwKfOF7tetJ/B3YAaD+W+cmQVasrSi+nMRDsVa7YWXCGC89DDEKgTKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=G2ETiX44;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C147606A31C
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 02:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C147606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=G2ETiX44
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A92AAzJ43917131, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794190210; bh=ROoS+Z6inS410WDiSLd3zANYD+WLf1f6jX9pUrXjKkI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=G2ETiX44tPy/GuBy7X1Mkb3kdcGsX34a3TXExSNPkE0fajGPGA5/nLQQGvLIjs3HC
	 lz3jEkPM2WmsBnCiemJOzLDkNftoSdArC+Sr8L75DbGHLQ58MgpSMzuhXJK8oj3PwB
	 qq4WS0Ws3MRMXczs3vTgUNmyHoyLyao0sJvVNQ/QpQjW+a/nF+icaFkIikghZHfxzU
	 +lPdB+JAvx7QEB6D938NwG62jZiL/bWZYq7S0B1FAU8OYDIuEpmcPGibw454DadFEt
	 gUOAPktnTk9/aZSo7t9q7RFDBqFJnx4INcR8H5GwC9IwTwBYdL5eY/l7Tgl6mAepor
	 4f9d4fyd2/meg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A92AAzJ43917131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Nov 2026 10:10:10 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 10:10:10 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 9 Nov 2026 10:10:10 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Luka Gejak <luka.gejak@linux.dev>, Zeshan Ahmed Nobin
	<zeshanahmednobin@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: Kalle Valo <kvalo@kernel.org>
Subject: RE: [PATCH rtw-next v2 0/2] wifi: rtw88: 8822c: check register values
 in cck_pd_set
Thread-Topic: [PATCH rtw-next v2 0/2] wifi: rtw88: 8822c: check register
 values in cck_pd_set
Thread-Index: AQHdbuazUOaT5QdG1kKmKm0xSXDCtbcjQrSAgAAAdACAAb2B8A==
Date: Mon, 9 Nov 2026 02:10:10 +0000
Message-ID: <b91cf87116d04aa7b3d1758ff58fab1f@realtek.com>
References: <20261107183403.50696-1-zeshanahmednobin@gmail.com>
 <cec3629205b2535d73f5285caddec290e7bda1c4@linux.dev>
 <4f3b37d5e7bdc710a54e46b4f28879b4f51ff15e@linux.dev>
In-Reply-To: <4f3b37d5e7bdc710a54e46b4f28879b4f51ff15e@linux.dev>
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

DQoNCkx1a2EgR2VqYWsgPGx1a2EuZ2VqYWtAbGludXguZGV2PiB3cm90ZToNCj4gTm92ZW1iZXIg
OCwgMjAyNiBhdCA4OjMyIEFNLCAiTHVrYSBHZWphayIgPGx1a2EuZ2VqYWtAbGludXguZGV2PiB3
cm90ZToNCj4gDQo+IFR5cG86DQo+ID4gRG8geW91IG1pbmQgcmVzZW5kaW5nIHRoaXMgc2VyaWVz
IGFuZCBwdXR0aW5nIGxpbnV4LWtlcm5lbC52Z2VyLmtlcm5lbC5vcmcNCj4gPiBpbiB0aGUgQ0Mg
YXMgd2VsbC4NCj4gDQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCg0KV2h5IGlzIGl0
IHJlcXVpcmVkIGZvciB3aXJlbGVzcyBwYXRjaGVzPw0KDQoNCg0K
