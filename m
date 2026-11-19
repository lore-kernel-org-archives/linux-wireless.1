Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067085;
	b=jlithX5cFr6DHOdIcMcI9AWQbqxZUu0VZ7DKc7c/KZAYwAwZsKprDHj9FbDMKf0JqxlB
	 VptncgKdCyUr0OTmHbgV6P/QtnRU3+e43Ia+8yXcIygsKihpl5vfmWDFIbOiYu8CNTt7g
	 bx53KVXEBNidGJXIpUpJEqgpgLlQOuG6rNzEVrXU7aT4dpfxlV/GTjhXaWgA9fVVT2oVR
	 W/ITQGsd8r1Ci1zhYfqxVpWi5w6uai5r27d6lE464fYOkyA+T5XomF1KuxOI5UVKRZGOd
	 M1bMWFi9Y/MQNUZ93gzj84QonsPSjb72THfuwCzBEq05f3ta+iyxjPCln3le/pcUNNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067085;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=snFtWnOWszaqEOqZ627hEWXGAw/gjxToI5E/d7dROuA=;
	b=pwCGty5vkSthvSCHWvE18cwFnCNOY6bi+obU8tiuKvUt5IAzbeMCWJnCqub9ZQLQvzQb
	 216R8lIsdnSUILv+isiKjIx0xVPo44BGJP8KuZT1LJ2Yj48e1Q4dgl78sWXi6FDVNuyXF
	 MKlm6tA+QaY4NyylYN192wL8aPfbRCb85dmG/W7hZnyaL9BPxve7l8AbfsD5Y04VcAlyx
	 9jzPwDRfgF5wy8RySI1n03Fz6J9/HR86IQwyEjYNstjuZ5NyH4SRHLAxo/3j5auolk/VH
	 FGFnileI1E9renq+eBEqPcw1jYUHjMeVLy2vR63P5nKgQo0aJRaWli8psGMyKqkKl4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=aewxMnfr;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9A1606A33E;
	Thu, 19 Nov 2026 05:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E9A1606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=aewxMnfr
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ5iKfqD2046212, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795067060; bh=snFtWnOWszaqEOqZ627hEWXGAw/gjxToI5E/d7dROuA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=aewxMnfr2fRnHbegR+NQ+ERr0O0vuCoghzZhQoKqEayG2/lqoKjm83ngC7Jzv5t8v
	 Ob2Nm0o4EuVd6GE7sd6C3Y0UpK929kvqH6KCaKirs4frRXk8803HCgXZXv+vPdBt3t
	 3q7ycp2yAkZn+95oQmX2+Yii3HIFXe1FgmBoBywB8aJLeEDKdCWt6vDAYOPtq5D8qT
	 Az1/1U9lBeMrkSZCOe0AIVQzM/eRvmDHmg0Mv/E7m/Ml14L/+6iPrq3qL5BkUD7W7E
	 aL1JwibPcdqTkT3a3EVlOY+1x5fT+HeA9Pihl2+Dd1tqws0dbJFDA13EDB229jjF4+
	 Ohozl4Z703jYw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ5iKfqD2046212
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 13:44:20 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 13:44:19 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 19 Nov 2026 13:44:19 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
CC: Luka Gejak <luka.gejak@linux.dev>, Bernie Huang <phhuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mehmet.fide@screeningeagle.com"
	<mehmet.fide@screeningeagle.com>
Subject: RE: [PATCH rtw-next] wifi: rtw88: find an associated station without
 allocating
Thread-Topic: [PATCH rtw-next] wifi: rtw88: find an associated station without
 allocating
Thread-Index: AQHdd0o+bjStWKX/JkO3+8ER2gvmqbc0sbJw//+osYCAAIjpkA==
Date: Thu, 19 Nov 2026 05:44:19 +0000
Message-ID: <bac61a31beff490f9477a65e1d7ce155@realtek.com>
References: <50ac2a659ca340dda44d63b02ffafac1@realtek.com>
 <20261119053343.2435185-1-mehmet.fide@gmail.com>
In-Reply-To: <20261119053343.2435185-1-mehmet.fide@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Mehmet Fide <mehmet.fide@gmail.com> wrote:
> Ping-Ke Shih <pkshih@realtek.com> wrote:
> > > Fixes: 96fbb84de4ff ("wifi: rtw88: handle station mode concurrent sca=
n with AP mode")
> >
> > I'd remove this Fixes, as my comment in Closes link.
>=20
> OK. Could you drop it when applying, or should I send a v2 without it?

No need v2. I will drop it when applying.=20


