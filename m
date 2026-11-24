Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510045;
	b=XJsfQETRqrsTrWm6zeYrIYp+VjB7d5DgIWCB1yLmL0ePWO1Z5c+oxgxGSFt0zYcb/6m/
	 +NJqshb2dBBjnXxPJC2HsJ12TeYYF9s9pAKkLPgGK10jJ0Fqjgqdh9yHV2Vz1ucO2jwhe
	 F7tkPWt2olZNn+uNF/fHF7JihV3vVILeDv7WQUQja3NJYG5OH540dNSMnsvycPhVDB4M+
	 9P4S5PTgwRG80pMsaFVXtn6OK+lo6V2Xuf7QXI0RZZskhLtcUzNw24fy+chk9mUu4jg27
	 aa4uZMMXoSxIe5XXpcQb1If5q1TGjAVER3mvmXi7pCRwPX+otc7mKvWj2yREhRyfuwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510045;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=F1XxTXLhdRM5eSOWVvA57bGjg+vjcOh4KXPfHCYyq4c=;
	b=PJ8XjKAOmg+Q0/qQQPetzjmZD6DNU/SxQTaD/3Kmcpa9RuXEKXU4+1iBrxNAmr6feITs
	 NKVTWezW1APpthYldt5MqMjfrgoh/+Ch1Q54t08BVStjOwDcZTxwv0Waiw7rK6QEqhrdt
	 xwS4lWLlWwxsnuPi59PyhRDVdnclD9FNZvr9TZUWmawVruegLETThCEoCQpwBtLajSyqf
	 ubfjlGQFWydj1abCpBLqMVSk9/BCVmwM6mdcLfjSeZQf+q95LooUc4XmLiUTpHTzxkskC
	 v9vGH2A8QbSwSAHcoyBbm7UNI0ecv9ys60/MX0sTPGh12qlKvD1HFblCo5Ho06n4DlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=jJoDyAui;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F369F606A31E;
	Tue, 24 Nov 2026 08:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F369F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=jJoDyAui
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO8lFsE52390711, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795510036; bh=F1XxTXLhdRM5eSOWVvA57bGjg+vjcOh4KXPfHCYyq4c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=jJoDyAuiknIuvFMQwcw1qm5Sc63zTKOc5yzE+TP8aJ2/nTOXfcFgkcmTBt9DFYtBj
	 mnupfZhLDjWNmCLje3N5s9/NDOgoT0I4bC+JXfAgONyeAVou5OkuKz2Kb21YhOOcAU
	 OA2VZ/kphMwJQpjVHza/fCVVD9YnnWUAjkhKUO8epoFTVBk89USxB3rUX3OneO+rb9
	 HcqW218bSnXpZrgyybrE2uZaC6EEHrbDr9WOUam7+HLzCBFaPF03Z0+jZj1mJeyO+W
	 k8p47Usg13MAtuX/rrTCOr07ilcBhDoHDH9pJC0Qc/JoKsltLYt6HMLFniLjWMGZQz
	 LMQzKvyZLF+vg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO8lFsE52390711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 16:47:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 16:47:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 24 Nov 2026 16:47:16 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Nicolas Schier <n.schier@fritz.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Florian Held
	<f.held@fritz.com>, Robert Sperling <r.sperling@fritz.com>
Subject: RE: [PATCH] wifi: rtw89: Add support for FRITZ!WLAN Stick 6700
Thread-Topic: [PATCH] wifi: rtw89: Add support for FRITZ!WLAN Stick 6700
Thread-Index: AQHde+8BhhYZ6s/2sUa+J25VzFKpB7c86Hzw
Date: Tue, 24 Nov 2026 08:47:15 +0000
Message-ID: <4b39d17686064f96aac71e1ca7cd878c@realtek.com>
References: <20261124-add-device-ids-for-fritz-wlan-6700-v1-1-f1a23c5df0fc@fritz.com>
In-Reply-To: <20261124-add-device-ids-for-fritz-wlan-6700-v1-1-f1a23c5df0fc@fritz.com>
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

Tmljb2xhcyBTY2hpZXIgPG4uc2NoaWVyQGZyaXR6LmNvbT4gd3JvdGU6DQoNCkknZCBjaGFuZ2Ug
c3ViamVjdCB0bzoNCg0KICB3aWZpOiBydHc4OTogODkyMmF1OiBBZGQgc3VwcG9ydCBmb3IgRlJJ
VFohV0xBTiBTdGljayA2NzAwDQoNCm5vIG5lZWQgdG8gcmVzZW5kIGJlY2F1c2Ugb2YgdGhpcy4N
Cg0KPiBBZGQgZGV2aWNlIElEIGZvciBGUklUWiFXTEFOIFN0aWNrIDY3MDAgVVNCLUEgYWRhcHRl
ci4NCj4gT3JpZ2luYWxseSBhZGRlZCBhbmQgdGVzdGVkIHZpYSBbMV0uDQo+IA0KPiBTdWdnZXN0
ZWQtYnk6IFJvYmVydCBTcGVybGluZyA8ci5zcGVybGluZ0Bmcml0ei5jb20+DQo+IExpbms6IGh0
dHBzOi8vZ2l0aHViLmNvbS9tb3Jyb3duci9ydHc4OS9wdWxsLzEwMCAjIFsxXQ0KPiBSZXZpZXdl
ZC1ieTogRmxvcmlhbiBIZWxkIDxmLmhlbGRAZnJpdHouY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBO
aWNvbGFzIFNjaGllciA8bi5zY2hpZXJAZnJpdHouY29tPg0KDQpBY2tlZC1ieTogUGluZy1LZSBT
aGloIDxwa3NoaWhAcmVhbHRlay5jb20+DQoNCg0KDQo=
