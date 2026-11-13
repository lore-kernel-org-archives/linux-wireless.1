Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559601;
	b=j5P6DLNR2R5BYkTMT7eQMk0fb3cf5SqUxtFamMuvRuehtM3ycasgMt/12tKth5opRcNQ
	 HZaXg/so6wwzFp0kze8GHOOthMhYl43Q5ilAYadkYgkyibh6JpVdOyJHp37fAf2iBBxik
	 pgqUqq/rA4kIVVRAdr0FsgizGm+1bo8o7bTCj657hVNE5ZOsHCFaF/fByfBLoxjo10VoA
	 cQGjf41V5iIgjCbjbafcAPcWbxEUaLOlUX3/JWtXo6zk0+B99LIH0tw9vtd6Xfu7HUg22
	 2sxAz77QQC+SBbcSsp0C8DmELtTxh+0dMQ2Xzp2B7LmljSWqTzSSCEAg03vbOqk8Z2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559601;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ViiU1MIWyHGZBwjyWcc7s8YHNPOuk46Qegsk5aVtV6A=;
	b=PUbC2ez6vs3EnNwWjAi5dpFePvjdYEaPSdBDweJkQ1gq3TVUZsnx9NS9zFSqkhJlPbpM
	 o5ikUaxZtOubGHw4oDZwrk6X1ur2XX6thB/DFAEDv3I0v7dpXs6Q9eDKBWzy5Ny5DxgTT
	 9XuD9lVugyyCf6dD9+NxGy8TZGnXdYeGZ9OVay9maM9p57Gb2LmhNJNYtc5UvsAzZELNn
	 gbowT8E12GTgKFxbpIN2B9VAX5PlP5Aemx3glfSaY5K7V4vxV/hH4GaG3BE+y4k8f/mqc
	 ZM2EzjKeocjnEumLkA8vlHUxqICtSDymYCtA92evhYbtvEiQS5ZMpaAwAQsGbyYJTXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MAEnLq0P;
	arc=none smtp.remote-ip=95.215.58.196
Received: from mta1.migadu.com (out-196.mta1.migadu.com [95.215.58.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D83C606A338
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D83C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MAEnLq0P
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+sNipIPh/hipiy7Pvn7mVVMyN+WeDyqpxgNzFczUVAE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794559599; v=1; x=1795164399;
 b=MAEnLq0PV719RfOSLS2O1ZMgrjVCT7Xk3UrPMc2mHi58/dsFUqIGLeLszQNkSOWkGby0wKcW
 ddIQ82IGz7K8UMy3KVCZF33m0lpzqYQ7n9aGSAMOOw/xN/gvdXXYhXNhk3km4Y+cu4BCXXlA9Rl
 jVgFTzKE33/jUo78A6mdDYfI=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 046c6614a0351de5;
	Fri, 13 Nov 2026 08:46:39 +0000
X-Mizu-Trace-ID: 046c6614a0351de5
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 09:46:34 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Jie Feng <hjf3108@gmail.com>
CC: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_2/5=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?xxa=3A_receive_VHT_SU_beamformed_transmissions?=
In-Reply-To: <CABOQOSX5B4zjORY0JZrt93899Af9V=YBFy7d5537efAQEtQgYA@mail.gmail.com>
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-3-hjf3108@gmail.com> <466A842E-68A6-4F5B-B0CB-8EF314AF34DA@linux.dev> <CABOQOSWrZXet+SYmvvG1B+idYmWx60F_prbQ3QGSiKaA7z-AFQ@mail.gmail.com> <85E23B83-4D3E-4270-B5A5-B835235093A0@linux.dev> <CABOQOSX5B4zjORY0JZrt93899Af9V=YBFy7d5537efAQEtQgYA@mail.gmail.com>
Message-ID: <0DC2D998-6A88-4114-B4A0-1BE6E377301C@linux.dev>
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

On November 13, 2026 9:12:13 AM GMT+01:00, Jie Feng <hjf3108@gmail.com>
wrote:
>On Fri, 13 Nov 2026 at 16:07, Luka Gejak <luka.gejak@linux.dev> wrote:
>>
>> On November 13, 2026 9:01:47 AM GMT+01:00, Jie Feng <hjf3108@gmail.com>
>> wrote:
>> >On Fri, 13 Nov 2026 at 15:46, Luka Gejak <luka.gejak@linux.dev> wrote:
>> >>
>> >> Hi Jie Feng,
>> >>
>> >> Thanks for the new version. A question and a comment below.
>> >>
>> >> On November 12, 2026 6:32:41 PM GMT+01:00, Ho Jie Feng
>> ><hjf3108@gmail.com>
>> >> wrote:
>> >>
>> >> > diff --git a/drivers/net/wireless/realtek/rtw88/main.c
>> >b/drivers/net/wireless/realtek/rtw88/main.c
>> >> > index e243738809..fe93c93b1a 100644
>> >> > --- a/drivers/net/wireless/realtek/rtw88/main.c
>> >> > +++ b/drivers/net/wireless/realtek/rtw88/main.c
>> >>
>> >> [ ... ]
>> >>
>> >> > @@ -1621,10 +1622,13 @@ static void rtw_init_vht_cap(struct rtw_dev
>> >*rtwdev,
>> >> >                      0;
>> >> >       if (rtwdev->hal.rf_path_num > 1)
>> >> >               vht_cap->cap |= IEEE80211_VHT_CAP_TXSTBC;
>> >> > -     vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
>> >> > -                     IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
>> >> > -     vht_cap->cap |= (rtwdev->hal.bfee_sts_cap <<
>> >> > -                     IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
>> >> > +     if (rtw_bf_support && chip->bfer_su_max_num) {
>> >> > +             vht_cap->cap |=
>IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
>> >> > +             vht_cap->cap |= rtwdev->hal.bfee_sts_cap <<
>> >> > +                            
>IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
>> >> > +     }
>> >> > +     if (rtw_bf_support && chip->bfer_mu_max_num)
>> >> > +             vht_cap->cap |=
>IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
>> >>
>> >> In v2 this was its own patch, 3/7 "correctly expose beamformee
>> >> capabilities", after Bitterblue asked on v1 for it to be split out.
>Was
>> >> folding it back in here intended? I couldn't find it in the v3
>> >changelog.
>> >Sorry, looks like I used the wrong commit on my local tree, will resend
>as
>> >a v4.
>> >Please ignore this v3.
>> >
>>
>> Can you address all comments I have send, as they will most likely apply
>> to v4 as well?
>Yes v4 will address both the csi and cfo comments. I will send it out
>after figuring
>out the correct fix.
>
>> >> I can see a reason for it. Without this part, an AP that is also a MU
>> >> beamformer makes rtw_bf_assoc() take the MU branch and return at
>> >> bfer_mu_max_num, so the new config_bfee code would never run for it.
>If
>> >> that is why, maybe mention it in the changelog, and in the commit
>> >message
>> >> too, since this is core code and the support_bf check now hides the
>> >> beamformee caps on every chip when beamforming is turned off.
>> >>
>> >> [ ... ]
>> >>
>> >> > diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
>> >b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
>> >> > index 55f1d3d324..5d58dff4fc 100644
>> >> > --- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
>> >> > +++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
>> >> > @@ -931,7 +931,7 @@ static const struct rtw_chip_ops rtw8812a_ops =
>{
>> >> >       .phy_calibration        = rtw8812a_phy_calibration,
>> >> >       .cck_pd_set             = rtw_phy_cck_pd_set,
>> >> >       .pwr_track              = rtw8812a_pwr_track,
>> >> > -     .config_bfee            = NULL,
>> >> > +     .config_bfee            = rtw88xxa_bf_config_bfee,
>> >> >       .set_gid_table          = NULL,
>> >> >       .cfg_csi_rate           = NULL,
>> >>
>> >> As far as I can see, 8812a, 8821a and 8814a are now the first chips
>that
>> >> can become a SU beamformee without a cfg_csi_rate op. Once
>> >rtw_bf_assoc()
>> >> has set bfee.role, the watchdog goes through
>> >>
>> >>         rtw_vif_watch_dog_iter()
>> >>           rtw_dynamic_csi_rate()
>> >>
>> >> and there new_csi_rate_idx is only written by that op:
>> >>
>> >>         u8 new_csi_rate_idx;
>> >>         ...
>> >>         rtw_chip_cfg_csi_rate(rtwdev, rtwdev->dm_info.min_rssi,
>> >>                               bf_info->cur_csi_rpt_rate,
>> >>                               fix_rate_enable, &new_csi_rate_idx);
>> >>
>> >>         if (new_csi_rate_idx != bf_info->cur_csi_rpt_rate)
>> >>                 bf_info->cur_csi_rpt_rate = new_csi_rate_idx;
>> >>
>> >> So if I read it right, it compares and stores an uninitialized value
>> >> there. cur_csi_rpt_rate has no other user on these chips, so it seems
>> >> harmless for now, but I think KMSAN would report it. Maybe
>> >> rtw_dynamic_csi_rate() could return early when the chip has no
>> >> cfg_csi_rate op?
>This looks correct, will put in v4.
>
>Another alternative would be to do:
>u8 new_csi_rate_idx = bf_info->cur_csi_rpt_rate
>and the != will never pass.
>

Either works for me. The initialization is the smaller change and doesn't
repeat the op check that rtw_chip_cfg_csi_rate() already does, so I would
go with that. Since it is core code, maybe as its own small patch before
the beamformee one.

Best regards,
Luka Gejak
