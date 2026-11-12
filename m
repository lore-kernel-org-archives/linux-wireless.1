Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484219;
	b=G3/Ewz4CFSUkKQkbs15Ke/ComWPFrer3Xe5fDf/3T+sfFRHniUCYZrSOE9KApAYQp8A3
	 Tr6PghL7FFOWqf/iB/pyoVvw4twT7dtWEf+c47ysrV9AnD+k5OC6/RS0yngw6CZjAQMu5
	 7/MJIeRzjMJxaez+RM5WSITfknUxCBYDTSg950jUUgLMv6l1ImspDwE8HznWTzAACxk4z
	 yqx3xbkbtEft/gFZ/6pH8RMlAjM6M3U+WnHVEv5IokTr4gCryn+YV9xczQj9kgdhlgnLZ
	 xKACoN/Cha3cxONlj69dXbXQAWwW9R/+WuWBjt7nWLwmaXGeH0jDj7fAJJssJWkMh8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484219;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CPEkMn6aNp4RE7HYZwI3NIJFB3o64cGN1Rs7OpBwDrc=;
	b=QNqCj1yHMNj4F9Fzs+kgXQyPt20VqMncu99DugTtVrMYYAgw3DvZCwdk8epRPjfQBdE3
	 kyDScxTK9ZH7Hn0z8zge/wbsYEiUIU9IiA5GFvWHnH4Mwai1CHh41EUs2IGcREJBoONX/
	 3A4mEhfhwE0UrSbjpQgeg7DDQHLJ43yVBSFbxFa5NFlInGOHDONDKqmelqwWEJXlut9i4
	 uM1w2sAFRXZ959okC8+8r+YLrtH+YQf+HKPzJZr/b4voPcnxL2X+2ODQBRV//1xJZReFZ
	 s/4a5z8KZ+l3DBkFh51r1nk2N3wclnexoEnkirEipC+atc4t8BOnBsddZrN3iQqMYng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YK6dKIkz;
	arc=none smtp.remote-ip=91.218.175.226
Received: from mta0.migadu.com (out-226.mta0.migadu.com [91.218.175.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3705606A327
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3705606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YK6dKIkz
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RUddLi8LtGaldHOznlnBf/C3hr1pJBlJ7yV/hJFOJfg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794484217; v=1; x=1795089017;
 b=YK6dKIkzxx1PbTsHUTCtOh0Q7yTcRMXHjkxiLnzXOBkE+Md8V9ktWjMiN4J3G3pw9VKLrxF9
 fP1kdd8uEGkvjBawjvIWvS3M4HQ1+AzsRtpqpgBSUzajaM3eJB6wx1Fr4mg8p2LPo7VHLH1WbJ3
 6lk2ybg1QRHgnrM4IVqqyyyM=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7da9e6a5da8df9ff;
	Thu, 12 Nov 2026 11:50:16 +0000
X-Mizu-Trace-ID: 7da9e6a5da8df9ff
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 12:50:11 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v10_3/3=5D_wifi=3A_rtw88=3A_?=
 =?US-ASCII?Q?time_the_countdown_downloads_from_the_TBTT?=
In-Reply-To: <20261111121525.358041-4-mehmet.fide@gmail.com>
References: <20261111121525.358041-1-mehmet.fide@gmail.com> <20261111121525.358041-4-mehmet.fide@gmail.com>
Message-ID: <1D396970-35B7-4B0B-82E9-24B523AD69C2@linux.dev>
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

Hi Mehmet,

Thanks for the v10. Two comments below.

On November 11, 2026 1:15:25 PM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
> index 2d81aaeed0d7..c30aa938f9a9 100644
> --- a/drivers/net/wireless/realtek/rtw88/fw.c
> +++ b/drivers/net/wireless/realtek/rtw88/fw.c

[ ... ]

> +static void rtw_fw_csa_queue(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
> +                          bool start)
>  {
>       u32 interval = ieee80211_tu_to_usec(vif->bss_conf.beacon_int);
> +     u64 tsf = rtw_fw_read_tsf(rtwdev);

As far as I can see rtw88 never writes the beacon interval register
(0x554), while rtlwifi writes it on BSS_CHANGED_BEACON_INT. So the
hardware probably keeps its default, and the TBTTs computed here from
bss_conf.beacon_int would only match the air at 100 TU.

Could you check the beacon spacing in a capture with beacon_int=200? If
it stays at 100 TU, that is a separate bug. Would you be willing to send
a fix for that too?

[ ... ]

> +     delay = rtwdev->csa_tbtt + RTW_CSA_TBTT_MARGIN_US - tsf;
> +     if (delay > interval + RTW_CSA_TBTT_MARGIN_US ||
> +         delay < -(s64)interval) {
> +             /* the TSF jumped: restart from the next TBTT */
> +             div_u64_rem(tsf, interval, &rem);
> +             rtwdev->csa_tbtt = tsf - rem + interval;
> +             delay = rtwdev->csa_tbtt + RTW_CSA_TBTT_MARGIN_US - tsf;
> +     }

rtw88 sets BIT_DIS_TSF_UDT for AP and IBSS and has no reset_tsf op, so I
think this mostly catches a download that ran more than a beacon
interval late, not a TSF jump. Maybe say that in the comment?

The start case computes the same next TBTT, so it could share this
branch:

        rtwdev->csa_tbtt += interval;
        delay = rtwdev->csa_tbtt + RTW_CSA_TBTT_MARGIN_US - tsf;
        if (start || delay > interval + RTW_CSA_TBTT_MARGIN_US ||
            delay < -(s64)interval) {

Best regards,
Luka Gejak
