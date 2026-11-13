Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556332;
	b=FcT8Dgq0vS9cPe3NwRQx9joviM7796ULgXvBvzcRi0PXaYuVWovxnBcHyjWZO8+tpkVH
	 o8sJzppILbY0hUCJq+FVw+g4yx1H7urn+wE+VPutYOStKm9DgBDeLROjEv4UG9eQjC51I
	 nUh46Z25K6alvPkfP6Un6s3aqdqyO2aEuip2Ueo/HNfir6Nw6WumYWjUywxE8VuZSHhzs
	 xHTTnA6M8oXwgZ6clSJD7V1On6V2t57fMiQbhC6k+Ztr5w6AaAOzC3vr+oBqzL9lW/2n5
	 EthPFV0igkh9dMVtakUcOuqLn+4UwWkStqHaMPzQ2I3+JRC3qLzqddD6ofbPNElXHeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556332;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1n95aAPwg2IwT0dfMgvXN2ZGybZbnsTTZYo+iakm2FI=;
	b=g7vqShoimDJnYQb4oRrr5f6n96zZfWlFEzXH8yQJWmCgdU3MO/xrIu+cR6tS7FalxsQJ
	 EedL+NU6KXhfZuEks+htJ2/6zc2eEdX0I4/SBwgA8fw5JzM3uwzUyNw6rny+n105Z9sNR
	 sjNNJxA2yReMjnY3ZVNLCkTLwNR0Kr4cHEBjopIYZffNlnITDN2tYjbAkRI7SESrVaUV5
	 nvmWDUdflSvIY7A9ryPnNRqN6NnKOkymMZCs1P3z9Ea/ug6OwQ/ArNOI8EhYOL3g8XBkD
	 oa1vpzS5L7SII/ZEOjG1LvPNKaDoRs8ZbtiY3PbdbY/9xjdC0rBH1opxih2Q79N7DDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FSgmam3W;
	arc=none smtp.remote-ip=91.218.175.112
Received: from mta0.migadu.com (out-112.mta0.migadu.com [91.218.175.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8372E606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 07:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8372E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FSgmam3W
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vHW+2YeyW7waLl8B7hAJg5Pmk6IRP/ExSvGaYGTcmo8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794556329; v=1; x=1795161129;
 b=FSgmam3WZxPu5S7a86SBoEXRg7PAy34cJUYY/9upNKg7tWniVv/QOYyZygACLeZXVfC1xBmF
 CF1W/wR35mtsMBW+AHc8z0RNIBMoJJg2uMHTRSgpl3AQHafOcEmLTr2SAJnv6WbnqfeTI6hcon5
 X3L6ClHC+jB4xt4QDyUtZp+4=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 87e2bc8332c15c1f;
	Fri, 13 Nov 2026 07:52:09 +0000
X-Mizu-Trace-ID: 87e2bc8332c15c1f
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 08:52:07 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_4/5=5D_wifi=3A_rtw88=3A?=
 =?US-ASCII?Q?_88xxa=3A_correct_carrier-frequency_offset?=
In-Reply-To: <20261112173246.3201729-5-hjf3108@gmail.com>
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-5-hjf3108@gmail.com>
Message-ID: <E6B17776-3DC2-43F5-9E44-97A8B63D0ACD@linux.dev>
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

Hi Jie Feng,

Thanks for adding the comment. One small comment below.

On November 12, 2026 6:32:43 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/phy.c b/drivers/net/wireless/realtek/rtw88/phy.c
> index d0c1fb65be..eed3e2cb60 100644
> --- a/drivers/net/wireless/realtek/rtw88/phy.c
> +++ b/drivers/net/wireless/realtek/rtw88/phy.c
> @@ -687,13 +687,15 @@ static void rtw_phy_parsing_cfo_iter(void *data, u8 *mac,
>       struct rtw_rx_pkt_stat *pkt_stat = iter_data->pkt_stat;
>       struct rtw_dm_info *dm_info = &rtwdev->dm_info;
>       struct rtw_cfo_track *cfo = &dm_info->cfo_track;
> +     /* rtl8814a has 4 paths, but only 2 of them report cfo */
> +     u8 path_num = min_t(u8, rtwdev->hal.rf_path_num, 2);

[ ... ]

> @@ -794,7 +796,7 @@ u8 rtw_phy_cfo_xcap_track(struct rtw_dev *rtwdev, u8 xcap_max, bool bt_hold)
>  {
>       struct rtw_dm_info *dm_info = &rtwdev->dm_info;
>       struct rtw_cfo_track *cfo = &dm_info->cfo_track;
> -     u8 path_num = rtwdev->hal.rf_path_num;
> +     u8 path_num = min_t(u8, rtwdev->hal.rf_path_num, 2);

The new comment explains the 2 in rtw_phy_parsing_cfo_iter(), but
rtw_phy_cfo_xcap_track() has the same min_t() without it, so someone
reading that function still sees an unexplained 2.

Maybe add a define in phy.h and use it in both places, something like:

        /* RTL8814A has 4 paths, but only paths A and B report CFO */
        #define RTW_CFO_PATH_NUM_MAX    2

Best regards,
Luka Gejak
