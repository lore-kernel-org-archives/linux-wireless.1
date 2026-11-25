Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572591;
	b=ZEyRPpDJTK1vjVxyLgE7VsQFC2HNOCkDFWgYiS20ySXdFcpFCUWM+i5Ef3bMsEJB6ekM
	 Nlx4fSPXkpPRFCy4zB57JV38E5vwzM+HflY4TEZUpGn/aeI6Gge8EiXg/DIC8qTJbsl0f
	 A/GDkEKheujfkXmFA2by+0kw+EmTwBei8hpedOG7/e8fagtGsLH3bJAO1L8Owpo0BEK62
	 9zB2dkfmE39iIwGpbJUza5XmmiVbz5ZogGxAOHOINCrDpIA9fHa7CubXARNrJUdsBZNkj
	 CmVEdW0zS23256ZPFUOOusAOc4rb6Sem4CXYqxuOWJhE64wg6zmugVfPgb6C1Wv7PJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572591;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=pAEhQHuhzPM9QpNEJzcvPHWtkspJyysroxoSsyRZXZc=;
	b=ocJQJtc8jIlUTsrNqOjPf4ARHMm4cZd4XdnpjRKvWsAgAUI45h8sDJ2djAiWgUgrnU7B
	 +DajwBk+CsgtWYAVdjnEyOpL/5mVryGo4zytKYHKzK6gPctdBRNUeEgu0IW4XVIyCeQc5
	 puSbNmPCKO1klZ5TSReJM7JIDKEirxaKn4AuysLooTZuSqO6NNf/T1fcFYmVMonRqYBLT
	 80vOJAkONoJ89lEi6UbB3yPb00SrgqLtEeL5OwueZ7IAXUXy+a8JMv/9Xv6upDB2LwkyS
	 DZyHckGYqeP7umU5I4YwMHaiRE3fIODPaZwQiCgjGZ8l5FoVYX57bQvZJxVrSk0swEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=fJf5+avl;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21172606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 02:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21172606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=fJf5+avl
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AP29PD203066713, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795572565; bh=pAEhQHuhzPM9QpNEJzcvPHWtkspJyysroxoSsyRZXZc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=fJf5+avltHKRKP+1ziyg2pOr+m44vJfta0kkTwukX7gxEYpy88SP0txrXeV+k+a6K
	 h7GSnlXRmEKqSSPLA4DqP51EmGh9r7GFFqTZkwftU7e4oFa0ArSiVKFm/5dm5ZQzoz
	 7LoFjvD7GzhdYlYGvyqjQIdPY4QhDiAf8apk5xYR6PNrN5YnX3K7isc+lKyicrkGzf
	 bPt80cplJDcn0EJZl/BbOXBvAxFZI5R8Q+5e88I1kOOdybuuFqXZZbMIhtiDTH4jBd
	 MHKdYRWEqv3/myDOkY2v/Klxm948IZ2KWkjbOZ7IG58a1I66j5DH1r6MvsXZCSw/RY
	 wqm7ml0711wwA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AP29PD203066713
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Nov 2026 10:09:25 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 10:09:25 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 25 Nov 2026 10:09:25 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: "jeff.chen_1@oss.nxp.com" <jeff.chen_1@oss.nxp.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
CC: "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
	"francesco@dolcini.it" <francesco@dolcini.it>, Jeff Chen
	<jeff.chen_1@nxp.com>
Subject: RE: [PATCH RESEND,wireless-next 3/3] wifi: nxpwifi: add netlink
 vendor command for TX power limits
Thread-Topic: [PATCH RESEND,wireless-next 3/3] wifi: nxpwifi: add netlink
 vendor command for TX power limits
Thread-Index: AQHde/PfcbHE7JOHI0W9cRiG+p1dEbc+CuFw
Date: Wed, 25 Nov 2026 02:09:25 +0000
Message-ID: <ba2cc83e97fc49c98ff2495792370766@realtek.com>
References: <20261124091028.807981-1-jeff.chen_1@oss.nxp.com>
 <20261124091028.807981-4-jeff.chen_1@oss.nxp.com>
In-Reply-To: <20261124091028.807981-4-jeff.chen_1@oss.nxp.com>
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

jeff.chen_1@oss.nxp.com <jeff.chen_1@oss.nxp.com> wrote:
> +static bool nxpwifi_txpwrlimit_subband_valid(u8 subband)
> +{
> +       switch (subband) {
> +       case NXP_TXPWRLIMIT_SUBBAND_2G:
> +       case NXP_TXPWRLIMIT_SUBBAND_5G_0:
> +       case NXP_TXPWRLIMIT_SUBBAND_5G_1:
> +       case NXP_TXPWRLIMIT_SUBBAND_5G_2:
> +       case NXP_TXPWRLIMIT_SUBBAND_5G_3:

Since vendor command is discouraged, is NL80211_CMD_SET_SAR_SPECS
suitable for you?

