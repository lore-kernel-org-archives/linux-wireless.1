Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208316;
	b=rX07VHSTw4bk6t4jl7tDjkh5IROrFu1js8QjgIad8T5rOTrNRx7nJdnjRABrVnDhU5jb
	 9BMrGMZ0G66Twr7Wsj6uBpyWGXtHmNbd+I+LS3EpQOVPJnPnHOdx0EahxUaQSUzhJSB7S
	 tb2HCDbe28QzFZXKh+DxoFwsdKshBYfhQwxeU4uVeMKGnywnj/XED8su/hEqsmo2+qnei
	 p6iKhIvVz6Qs/Lv/6cZIgA+E9s8Z3nex0UUsg90DauzJmfLfWsZQbkq8ZSl3M/UbmNkXt
	 CfEemt26op2f2/rryBZ715lYgX+FdZsBAvuSBNwPekmfKoCyiejIM/Okt/m3LdkyIKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208316;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Efpu2m5sUCkdtOy2mV59c9dnNklW/tHHx/bjnmS0jw4=;
	b=p4UlkuPO73zmXgfY3r86NFOY/RuvR076LnIZrytC4PbQgdEwUrexIplDE4Ca6qOkimy5
	 miy5JfVpg5zn+JwghtadNwV5ml+y2AD71QrCXUOlOV6tkEInnwzMDweunCHpgq5JtIuCq
	 aHF5V6nEbm0eZAsClad7Xh+GDEAcEt0yvE1YuPHuD2Gja8AtlZwsL2ll75D5/HAKeii2w
	 bR4z+SPRAPo0wRuF6784uA6QFG+/6jplDgPyW58kQNIs5wV8u1Dle94Ug1KAwd6ZlJkXV
	 L7QLIKnrH+jqgZ1a8BHa27ehXQWTuxS+0m2h5Qa5hN+1GYoQkIBpgHP9QJR1JeRHq3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DpSB5oM+;
	arc=none smtp.remote-ip=91.218.175.21
Received: from mta0.migadu.com (out-21.mta0.migadu.com [91.218.175.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824CD606A334
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 07:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 824CD606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DpSB5oM+
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wpRI+2GrIdAPSLZrCXpsQnyv46ZEoGtZdJa6JUTIvvo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794208313; v=1; x=1794813113;
 b=DpSB5oM+KG6vva4r4fO5NTSKG8V+dLgn6FFKBJdR8I6lRBjm98ebMxSuTwld8rSE0vqeB5Gf
 TrF2taRHuMz4gef7v0ZtLxPmffIr6K9Gpk7UdxGtj61eESGUJrLP/yN3twLwvxN74lcPQr8RCUp
 mfYte1q6HTakYvWOgv0vODos=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 583b959740c77b18;
	Mon, 09 Nov 2026 07:11:53 +0000
X-Mizu-Trace-ID: 583b959740c77b18
X-Migadu-Flow: FLOW_OUT
Date: Mon, 09 Nov 2026 08:11:51 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Kalpesh Solanki <skalpesh942@gmail.com>, pkshih@realtek.com
CC: kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_2/3=5D_wifi=3A_rtw88=3A_skip_al?=
 =?US-ASCII?Q?ready_reset_station_in_rtw=5Fsta=5Fremove=28=29?=
In-Reply-To: <20261108142708.489067-3-skalpesh942@gmail.com>
References: <20261108142708.489067-1-skalpesh942@gmail.com> <20261108142708.489067-3-skalpesh942@gmail.com>
Message-ID: <83E3139E-BE19-4EAD-9BCB-6DABBF8D1942@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Kalpesh,

Thanks for adding this. One comment below.

On November 8, 2026 3:27:06 PM GMT+01:00, Kalpesh Solanki
<skalpesh942@gmail.com> wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
> index f7708ad17b6f..a74f199a93ab 100644
> --- a/drivers/net/wireless/realtek/rtw88/main.c
> +++ b/drivers/net/wireless/realtek/rtw88/main.c
> @@ -384,6 +384,9 @@ void rtw_sta_remove(struct rtw_dev *rtwdev, struct ieee80211_sta *sta,
>       struct ieee80211_vif *vif = si->vif;
>       int i;
>
> +     if (!vif)
> +             return;
> +
>       cancel_work_sync(&si->rc_work);

As far as I can see rtw_ops_sta_rc_update() can queue rc_work again after
the recovery has reset the station. If the station is then removed before
the restart adds it back, this return skips the only cancel_work_sync()
and rtw_sta_rc_work() could run on a freed station.

The window is small, but maybe the check could just go below
cancel_work_sync()?


Best regards,
Luka Gejak
