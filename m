Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962778;
	b=E7YvCwIXiI4bgizm/0npu/BxK8TThF64L4HBzByGqkp0VjnwW1fuvy2KOD4Bxnuwkgrx
	 aCY+hazcCZTjEvXI3g31cHQtldJNmPzDMDSpE0GUBgXeS8j7tviP6VT/lW+w8k2RRbH8i
	 Igy6pyVsDzdkzF4kUrwdRKQMmJkKAWN4mG1EC4lcMZpJ5CLRyLakevbvye3qzt1v8Vxdu
	 2yUpkM9O52/Cdt71uBSQJyXNu5+XZDQ5XRiQMsVEmCT6x+SGBT18EoiS4drCcHs4bQDO0
	 e9eyAtPlW5iG2iH2gJe8XrewmzGiYiUZavFzWsJhJJ+7GGgFtQ8iyndHe5gmG5NInxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962778;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=EiYkSaP5dGb5CUj9ezeFxg3h4M419wH0by02fQ2rKfc=;
	b=sJvnllO4pm/rqdNxBW8D+bUQjUTCJp9Fj95cYEOHoKuVSTbj0nZwEgK2I5tFt+VD6i87
	 lABkBHURlhtSI3oI1WMNqGzdfREhhJQd979w+u44c6O86I4jjXZk8UrxwFwZPeY7fD96Y
	 iaNGDXhGrm52iWKGCwWsqYONh6+0KI0apiBOwoVthOLnh1tMXCnLx1wqWsUiqlKVEK6HT
	 xhIYELfW0bc2EywgbxGE1q19qTT+lhmeUOTnbM7agIMHYn521hUNtL8DWXDNrWJ7NXToo
	 rSrEI8FOY+jYJ0SsFC3auYfFlng+pOgHuSefXUctbY8LRFMt3vdmNG18NTZKxTI84/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Hrz6InkU;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAAD606A31C;
	Wed, 18 Nov 2026 00:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBAAD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Hrz6InkU
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AI0jcffF784555, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794962738; bh=EiYkSaP5dGb5CUj9ezeFxg3h4M419wH0by02fQ2rKfc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Hrz6InkUD9+A/xraD6+HlZ69xtnPb4UITv5+hBk3cfu7cfMr/Osc/XgKK6jIZgsXz
	 vKTLAsqKv+G6TVwlDxP5FIB60PDaYKj/7nwhZgumMh33UKdpNfXi0ndLM0Ac8DoT58
	 +lhUEyLAOHVF48lUSOuc64wTHiTbU7MY2lJhFWl9gWguvTPRVHDOMH6zH03wNkFXTn
	 vdwcAsvpOn04TRVqNfYG3iLwAZfCK5tHcfApSIE4EIsam/RK8sfJj2UEF+fD3U7euQ
	 TwuP+GTXn2PqPtDxcpULUJEV3q+vOAut+2XYGjGgCTgCHZFesStVdgk/TYjIUgqMmk
	 DvTRIL0jDcKFg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AI0jcffF784555
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Nov 2026 08:45:38 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 08:45:38 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 18 Nov 2026 08:45:38 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
CC: Luka Gejak <luka.gejak@linux.dev>, Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>, Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>, Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>, Brian Norris
	<briannorris@chromium.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mehmet.fide@screeningeagle.com"
	<mehmet.fide@screeningeagle.com>
Subject: RE: [PATCH rtw-next v3 5/5] wifi: rtw88: clear the restart flag when
 the device is stopped
Thread-Topic: [PATCH rtw-next v3 5/5] wifi: rtw88: clear the restart flag when
 the device is stopped
Thread-Index: AQHddraCwLcTtTxZpUS0XSkBmrLE8bcyX6sAgACe/kA=
Date: Wed, 18 Nov 2026 00:45:38 +0000
Message-ID: <749d191c3baa42179f87e1af5b9a1a19@realtek.com>
References: <20261117171003.1840491-6-mehmet.fide@gmail.com>
 <20261117231558.1952531-1-mehmet.fide@gmail.com>
In-Reply-To: <20261117231558.1952531-1-mehmet.fide@gmail.com>
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

Mehmet Fide <mehmet.fide@gmail.com> wroet:
> Hi Ping-Ke,
>=20
> Commit 3f2238709f5d ("wifi: rtw88: clear RTW_FLAG_RESTARTING on stop
> and start failure") in rtw-next fixes the same case, so please drop
> this one. Patches 1-4 apply to rtw-next as they are.

Dropped from patchwork.

