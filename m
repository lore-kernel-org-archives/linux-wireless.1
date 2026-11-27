Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758454;
	b=2Ge+u54IX4SfwGGoj68B4PKn/UsY5PWoFxKp35Edg9BDyRfoBdFbG/h+Z6dO1AyUwDm7
	 X3Sw9+3dEXvi2Zi3xQgd6RFJz1OZaQxtL3zDUecPYvI51Ez8qYDOLNYmfZ4U/Qm4QmySU
	 Ea1kXpG3bt4/cwi+vkPaiQe4qg6IfnIz6ZoZFQoyLFdE0/2zPhNykdQbRdAidSVCEYiik
	 VEkEabD86HFimPnenjRoDu7IuHkJzeUq2zZYrPG3pZXAVopVlqPsw16X+apeizWetEX1r
	 PfMK+PpatqX9YgZuW7sHKwvQH+9iXvmZ3puzwUynbiSTXHLBH1G0FdkV02xz+Nahq7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758454;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=U0DWW2OgC7e4GwLwVN6kKykZRjBL+fJwK6iEMSqmG4k=;
	b=1OyAuXO50u7vq20WRWXGPmBmhol03tat8+zVvaqWHAjVmPGWODIO8j1Low59oWdFeDuo
	 ErRgG4Mgw3Tws/gW6mP4wMzwwahHtyOqR9XBDQ8DixXg1inlwAJdaqomho2HY+UCa5SED
	 q9oq+a7U7Rn5JMua4p/oKW0zzY6kygXf+BOCDf7yHltFxEMI9zwV+WPtt9kIToLi7OcYK
	 1uzcfXDYiXZOOYQ4ZbFPn2TCMQ+P+Ud0SkfZ2e/vevkjm9PBwUL42ArQDVjbmUGbfzmyo
	 1O4eI9xJBRYMkAXjzC9hq5XWBvqYGHg6ScCicjjUcovRAjSQwx+//1p8BIICwBUOsPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Nhr5ybtt;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88AE606A31C;
	Fri, 27 Nov 2026 05:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C88AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Nhr5ybtt
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR5koqpF664459, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795758410; bh=U0DWW2OgC7e4GwLwVN6kKykZRjBL+fJwK6iEMSqmG4k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Nhr5ybttQm15f67lGvoeo2uIkLxwa2zrDJyanfYAnnKlnIofohVoihiJLV7dX6ro6
	 +XQZQ/qVOzYHN8JmkYdKoq0JHXCCz5yW8MQTBswnTjH7k/2iS87FJ5jmYGO7IuBI7C
	 vGiByjt6JHUURd3SS4PC/LbWrzEvQWHoh9eo8F6qlQAfrA/tpDHTSBhby/C7DiwAZF
	 A1XNh424inQ7ohT2xqCxTJFN9j3mBUjysuXnfgTUtx0xEebntmKJ8JtIkPMch5Mleo
	 1eBBvO3dqa9DOBmPSYPygHxJ1gnVrpn56yNQsBMdxB5EVh7DENBqTNeBWRA4FRfVHr
	 qnJ91A6fZe6cA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR5koqpF664459
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 13:46:50 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 13:46:51 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 13:46:50 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 27 Nov 2026 13:46:50 +0800
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
Subject: RE: [PATCH rtw-next v4 3/4] wifi: rtw88: do not drop stations when
 collecting them for an iteration
Thread-Topic: [PATCH rtw-next v4 3/4] wifi: rtw88: do not drop stations when
 collecting them for an iteration
Thread-Index: AQHdeeyxSSDahH1/2E62F4ToQxMO07dBcVvA
Date: Fri, 27 Nov 2026 05:46:50 +0000
Message-ID: <7c47aed9310f4168b66a68f88f46f5bb@realtek.com>
References: <20261121191528.591334-1-mehmet.fide@gmail.com>
 <20261121191528.591334-4-mehmet.fide@gmail.com>
In-Reply-To: <20261121191528.591334-4-mehmet.fide@gmail.com>
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
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>=20
> rtw_iterate_stas() allocates an entry with GFP_ATOMIC for each station
> it collects, and skips the station when that fails. Once the firmware
> recovery resets the stations through it (next patch), a skipped station
> keeps its TX queues on rtwdev->txqs, and rtw_txq_init() later
> reinitializes a list node that is still linked.
>=20
> Link the stations through a list node in struct rtw_sta_info instead.
> All callers hold rtwdev->mutex and no iterator collects again, so one
> node per station is enough.
>=20
> Skip stations without si->vif. A station moved back from ASSOC to AUTH
> has gone through rtw_sta_remove() but is still found by the atomic
> iterator, and mac80211 can free it without calling the driver before
> the iterator runs.
>=20
> Reported-by: Luka Gejak <luka.gejak@linux.dev>
> Closes: https://lore.kernel.org/linux-wireless/4EE3D95E-988D-4514-9849-95=
46CD49D8E9@linux.dev/
> Fixes: 78d5bf925f30 ("wifi: rtw88: iterate over vif/sta list non-atomical=
ly")
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>

