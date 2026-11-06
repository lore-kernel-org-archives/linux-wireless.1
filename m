Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985669;
	b=mCbK20FxTVxt9cu90TLv8L7aw2ZrTVgeAnDD30GR4B2RdNf+5pOB9zpNv1aWKxCfQZ+K
	 zHTpYoDtkLWgFGJoJzsZ1LezsjeKRFsU9XP7xUemcRIHnInfgqUOQaU1RwgykUbSBZjfo
	 oFnf67mDil5mDe161HJfktb94X//7KNRudVL8VK6yTFffurHnOLOQl8GmnPeniI5Nkqyi
	 Pg7vpoKUYFuGPiX/lTXRPvToWuHBIrfnupMl1JVCSK6O9wqRU8lJbrO9dslrM6gs/g/tV
	 pBJYt4uVSBml2m35lbTk2iEnHoxNE8/qLR/UxlzRR8iDMwUAmikDe+moECottAR3hMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985669;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=2uciuXx9t93tvdC10P6QxeWs86V1VIdY0xyTA3KoNZI=;
	b=isTkcA4wg4QSFm1QsSc+GEE0LVp84ULBjtC8eJKQXEdZj4llHaDaG8dSuSD108WZ6cSW
	 yIElS51ASVtgl2GLNuUaJJW/uI2pDTHIv5y8TNckS8jHYd9snIFuRNrLWFvSgzQ30kWM/
	 KUFBbRSlamXfdGgmgr+U6lAkfXDr7u7nFJb6SY/3Iwe+lHIeqSgI6b51uWru1fllAVRtj
	 4JLNpPckiRBErfdrRL0DAPly96m3CYrcPUTBcL4C5qVBHbdcW/kzV+t9Ccsfbu3uukC12
	 ChIKs29Dq8mYoMaRVGtxtYHcvY4pblTm1cAnKJsNjg3qHpkrmdOMvUaMSOBCv5qW2mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.116
Received: from mta0.migadu.com (out-116.mta0.migadu.com [91.218.175.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F40606A335
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 17:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85F40606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=U3KtjihvMw59KAoKlK0ibdUtLPoIyLmaO5dhG0+0RAE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793985665; v=1; x=1794590465;
 b=uEe4r4FHE52+wuzICxpa3ub/8iFjzr9BuBBXEDInYG8xZTqpraqiumOnq/g/f0xdiQuKVrMb
 6ONl7E3zlHqoWLTBK5vaLjxYxErySew5ImJbb1enFj33nqX2YbcdhH6R9KPp8Eljh2WkIK0hulX
 DilAHMf91qKAQ+JboCiCnUlw=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c0e5d4def3728738;
	Fri, 06 Nov 2026 17:21:05 +0000
X-Mizu-Trace-ID: c0e5d4def3728738
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
Date: Fri, 06 Nov 2026 17:21:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <c057826a90d64c801fd36ceabba48a504d784274@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v2 1/7] wifi: rtw88: 8812a, 8814a: enable STBC
 for HT transmissions
To: "Ho Jie Feng" <hjf3108@gmail.com>, "Ping-Ke Shih" <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, "Ho Jie Feng" <hjf3108@gmail.com>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261031070950.425176-2-hjf3108@gmail.com>
References: <20261031070950.425176-1-hjf3108@gmail.com>
 <20261031070950.425176-2-hjf3108@gmail.com>

Hi Jie Feng,

One comment below.

October 31, 2026 at 8:09 AM, "Ho Jie Feng" <hjf3108@gmail.com> wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wi=
reless/realtek/rtw88/main.c
> index 0f23498b5c96e406581c06a524e9f270873866ae..f7d7b66844862ff01533b8b=
640ed35738169673d 100644
> --- a/drivers/net/wireless/realtek/rtw88/main.c
> +++ b/drivers/net/wireless/realtek/rtw88/main.c
> @@ -1585,7 +1585,7 @@ static void rtw_init_ht_cap(struct rtw_dev *rtwde=
v,
>
>       if (rtw_chip_has_rx_ldpc(rtwdev))
>               ht_cap->cap |=3D IEEE80211_HT_CAP_LDPC_CODING;
> -     if (rtw_chip_has_tx_stbc(rtwdev))
> +     if (rtw_chip_has_tx_stbc(rtwdev) && rtwdev->hal.rf_path_num > 1)
>               ht_cap->cap |=3D IEEE80211_HT_CAP_TX_STBC;

This also changes 8822c, which already had tx_stbc set. When its hw
feature report says one antenna, rtw_hw_config_rf_ant_num() sets
rf_path_num to 1 and it stops advertising HT TX STBC. That looks right
to me, the VHT side already checks rf_path_num the same way, but it
would be good to mention it in the commit message.

Best regards,
Luka Gejak
