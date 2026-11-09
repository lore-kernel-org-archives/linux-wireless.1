Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794193415;
	b=2ywsfekSA4QMmCfjWgbBSScHZx23VvLJoKFkzTJPNDfqv4gkezreJ6PRtwGFeR2AUyCh
	 cJy8eBV0iHvXdK6QQjReC8qmFuNosbe7AzaakMMlyPFG9Ns93my952QqZpDDqRnFSpqJV
	 +Fz4GRpP/Ae61VVaZJpTHMWUHCUlGUDIV+VG2nwbtq5t353+tBhc/MyTxoRrVOft2KlS1
	 s5WTQudhgWULwvYbb1e8WYYek9UFeqRSSIBPNv5djhPPaUAbDqB1lXe98VWBaHByfuN5U
	 jln7cs8GK6ijzfsyCNsuL5Yqnp8sRSGBphML39VEB+UNI6O/A1PV8ZOEgB3JXGYxhCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193415;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=tXu5T4GLJHX2EDsKHv20YgUh5W6td40/arHyMMDpL78=;
	b=1YMvRdXzmfXV/5jeobS/32UvIL0tT8AVgXyM9s2h593J57WGDuqJZaq5k1Z5++4yan/L
	 gKAxJhn2BH/2FzJhAUJpZGWuE6SlYZw9+uc15Gl1nfmTeoeM3CAlHWTgTtOJKx90+dcvR
	 A7R7uWu2XAgxk5fDhpFmUDfL/jjfubu/7HpNBAa+maz6spH75sj914pFhP+JJxMfgATPn
	 RcwFjYQ+v7NfZppBtOctGU2g0K0syFy++JZREzax4SS6KN315AmTFoPQQyv5LcjKNJkWo
	 r2IelfUUYwswiFP8svHG+FypdoOO+FofwiBVGWRmasLk+1TwyEAz0dRfhwTEeUUqePw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="U/DbnYTk";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8804F606A31C
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 03:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8804F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=U/DbnYTk
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A933HzJ43971085, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794193397; bh=tXu5T4GLJHX2EDsKHv20YgUh5W6td40/arHyMMDpL78=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=U/DbnYTkf8LLG+BtuxtR0ilBG+UKvTXiWl+X2rgFuwWh5zNk1nCE6N7d+2hR1Wpla
	 UW8mFIiU1U5ud6vfGLvz5vFNxgXG60u/EmIA90prXd6B+RytcAjhH9brHt0iAlbHd5
	 ckczxBoluHSMPi47v5BlHnr9zy9s8bE19JojremwHdG9nQx1skLlBWbcY7nZRSwlB+
	 JDXQXuRU72diIZq7SEXb0MRf7Vow/Etdgq/CP1JtgNvcxhekQ3q2cV+PYCieLopFP7
	 Hc+F0hmjgprqDdz7zjv0D5sV+hRrrBFR6M8W7BTxIsdqP0QY76FaIyfR/SmaxJnKmq
	 bKtgF0bjvbSow==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A933HzJ43971085
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Nov 2026 11:03:17 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 11:03:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 11:03:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 9 Nov 2026 11:03:17 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: rcfa <kernel@cubiculum.net>, Johannes Berg <johannes@sipsolutions.net>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH wireless] wifi: mac80211: deauthenticate on stop if an
 association just completed
Thread-Topic: [PATCH wireless] wifi: mac80211: deauthenticate on stop if an
 association just completed
Thread-Index: AQHdbyHTE6j5F5xcNUm+WfEjgE55G7clDtAA
Date: Mon, 9 Nov 2026 03:03:17 +0000
Message-ID: <09057f3f3e8a4a4284bd6f0ca3613b1e@realtek.com>
References: <20261101201251.1106968-1-kernel@cubiculum.net>
 <20261108004536.1897266-1-kernel@cubiculum.net>
In-Reply-To: <20261108004536.1897266-1-kernel@cubiculum.net>
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

rcfa <kernel@cubiculum.net> wrote:
> Hi Johannes,
>=20
> I see this patch was marked Rejected in patchwork on 2 November, but
> I couldn't find a reply on the list or in my inbox. Could you say
> what's wrong with it, or how you'd rather see the race fixed? I'm
> glad to rework it.

I guess your patch looks like the one made by LLM, so just silently dropped=
.=20

>=20
> I sent it for mac80211 rather than only for the driver because the
> end state is mac80211's own: without the change, my reproduction
> warned in ieee80211_do_stop() and then hit a NULL pointer dereference
> in ieee80211_rx_mgmt_beacon(), with the rtw89 fix already applied.

FYI. I'm still considering the patch, not applied yet.=20

> The rtw89 side is posted separately:
> https://lore.kernel.org/linux-wireless/20261101201344.1107256-1-kernel@cu=
biculum.net/
>=20
> Thanks,
> rcfa
>=20
> (Drafted with Claude Code at my request.)

