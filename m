Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555995;
	b=oyFYfpOJdhwc1j5TamBgNtanZ1rdYsv9aprSgDYP+qc+cPWRsgHAKGY1grxL5RUrVrK8
	 wnmsoy7kHZqCyyblQYpphvnPZlaWp4a6y8NYCWYPsyeztv964xW3irfkGWauDSHCM+L27
	 OImKZcs28BrOesVC4b8oRuwxjkmCkhtRJbCEDJWCKVso1CUnbQjDiOu+AJN7HQ6l2UCcw
	 7jieNqR/INc1GEOHMySLpC8EJBMRZX9EIzTgp0NDu7NXP2Uxw8qjm5uG4owR36Sd0o5XB
	 d4jiLKfz214ipOEXjXDZio69klcBYKy0B5dgKxtkJF3PdNSrEkrNj93Nhk5snoEnt9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555995;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=822a26UQTpzALUF2v5NcjZf5+NNRawax+al5Y0ThRAg=;
	b=gl51rHHhuCHzY0Nj5uTVkApdZwJXccjIZxX8DHd31K9WPlwk00SS0yKLmz8WzeqKtaPB
	 g9nvkXg4hxybIkdCpN40AX+yesAetVgnaXmuFRxtWiu7pmPG0xxJTYJg8CIW31ob1n4JN
	 vZ0AlEN6jV8PCV530OfShNe3+UKjh2kfdMsLU95c7piKHVQIopj3KM/aR9YfRTUJq/YAH
	 OcNL/1RWl6n/3GcJPE3HZobgFPkw2WPGx/oijhHjMnXZ1UeVziyFdjEcuENGrK8SYuMdG
	 OmZIDI+zuT8a4LrBp7apXvx5HsY9PXV0mYwmEdBmMPDJsXQax2m27kh+sjSw+mrcfeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EjjkW8Zn;
	arc=none smtp.remote-ip=95.215.58.31
Received: from mta1.migadu.com (out-31.mta1.migadu.com [95.215.58.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561B5606A32A
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 07:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 561B5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EjjkW8Zn
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cZ2JcvavG8dTDoX6w01E1tMZFPmQ8BIV3mXJZzmljcU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794555992; v=1; x=1795160792;
 b=EjjkW8ZnGGmdwFDW5qdl6sDzsgeiHvLi31iz3BBPUe7p8mX7TuBagR5XZSo7GkfDwCzqqAL2
 NNumfSnnmDL4w142zjQeK94//HQz2haLz+08NabP6spfT7jqUgjduyvc8tCCwzJ1bMwZI+LR5lV
 SAXO/hpp+UJsXcZLrkxY0pEc=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 70574e2b07ad1e61;
	Fri, 13 Nov 2026 07:46:32 +0000
X-Mizu-Trace-ID: 70574e2b07ad1e61
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 08:46:31 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_2/5=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?xxa=3A_receive_VHT_SU_beamformed_transmissions?=
In-Reply-To: <20261112173246.3201729-3-hjf3108@gmail.com>
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-3-hjf3108@gmail.com>
Message-ID: <466A842E-68A6-4F5B-B0CB-8EF314AF34DA@linux.dev>
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

Thanks for the new version. A question and a comment below.

On November 12, 2026 6:32:41 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
> index e243738809..fe93c93b1a 100644
> --- a/drivers/net/wireless/realtek/rtw88/main.c
> +++ b/drivers/net/wireless/realtek/rtw88/main.c

[ ... ]

> @@ -1621,10 +1622,13 @@ static void rtw_init_vht_cap(struct rtw_dev *rtwdev,
>                      0;
>       if (rtwdev->hal.rf_path_num > 1)
>               vht_cap->cap |= IEEE80211_VHT_CAP_TXSTBC;
> -     vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
> -                     IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
> -     vht_cap->cap |= (rtwdev->hal.bfee_sts_cap <<
> -                     IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
> +     if (rtw_bf_support && chip->bfer_su_max_num) {
> +             vht_cap->cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
> +             vht_cap->cap |= rtwdev->hal.bfee_sts_cap <<
> +                             IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
> +     }
> +     if (rtw_bf_support && chip->bfer_mu_max_num)
> +             vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;

In v2 this was its own patch, 3/7 "correctly expose beamformee
capabilities", after Bitterblue asked on v1 for it to be split out. Was
folding it back in here intended? I couldn't find it in the v3 changelog.

I can see a reason for it. Without this part, an AP that is also a MU
beamformer makes rtw_bf_assoc() take the MU branch and return at
bfer_mu_max_num, so the new config_bfee code would never run for it. If
that is why, maybe mention it in the changelog, and in the commit message
too, since this is core code and the support_bf check now hides the
beamformee caps on every chip when beamforming is turned off.

[ ... ]

> diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> index 55f1d3d324..5d58dff4fc 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> @@ -931,7 +931,7 @@ static const struct rtw_chip_ops rtw8812a_ops = {
>       .phy_calibration        = rtw8812a_phy_calibration,
>       .cck_pd_set             = rtw_phy_cck_pd_set,
>       .pwr_track              = rtw8812a_pwr_track,
> -     .config_bfee            = NULL,
> +     .config_bfee            = rtw88xxa_bf_config_bfee,
>       .set_gid_table          = NULL,
>       .cfg_csi_rate           = NULL,

As far as I can see, 8812a, 8821a and 8814a are now the first chips that
can become a SU beamformee without a cfg_csi_rate op. Once rtw_bf_assoc()
has set bfee.role, the watchdog goes through

        rtw_vif_watch_dog_iter()
          rtw_dynamic_csi_rate()

and there new_csi_rate_idx is only written by that op:

        u8 new_csi_rate_idx;
        ...
        rtw_chip_cfg_csi_rate(rtwdev, rtwdev->dm_info.min_rssi,
                              bf_info->cur_csi_rpt_rate,
                              fix_rate_enable, &new_csi_rate_idx);

        if (new_csi_rate_idx != bf_info->cur_csi_rpt_rate)
                bf_info->cur_csi_rpt_rate = new_csi_rate_idx;

So if I read it right, it compares and stores an uninitialized value
there. cur_csi_rpt_rate has no other user on these chips, so it seems
harmless for now, but I think KMSAN would report it. Maybe
rtw_dynamic_csi_rate() could return early when the chip has no
cfg_csi_rate op?

Best regards,
Luka Gejak
