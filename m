Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794518964;
	b=hbZYnoFu3OOQYyLX2xuHn9hcd3wWh7ZfZeUagXHWh0SBkFMhmWlyTEUwU5C8eTeH35kv
	 8rhDQnwzbC1NPcFjon0xgB/wU2pdV9F7EwLr39d7Sn2qKPj+33CxHMfzN+Jk6hDktMB8u
	 C1QL6L1+gVndGUjmz0NgFjTSdnNONDqphAqh8xZrMcwSggET2KsMTGBC2i0KuxVvHg3ZD
	 KoWSIYYIB2SEbUtZoF0YeaRl2ojn46UtvtYSTof98kS6UHXi+YaZfv/VHXZrVjSW5IkuL
	 YOKzZlM7CwRKeRHYzb5r2qTabPLnjjs7a/B6OE5E0dFP3O6v75SyW0GAwsMpi0xu9sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518964;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=yFf0xu+bjhuFMLvEepScyEDDOqU79rBKKVexTQgAMoU=;
	b=RyIgaSbhG08xLiSi3ZPje+Df4pz8OwKrr+awuEtkQYzV9FZ+34Ghpz29vfFg4j9ZvkW1
	 MhIhcNfJ9la7WTmXx732fOYbfPcVJuaDxCRXSKRX0xlisXF3W9QA+4aTncBzSP+t/XFw+
	 x9WbqFf86CcWWlg/dL1u1eGQOx1ThegUt/Bp2PpJ98GnVlXpzzqp5kz4XtgjPKxaOJNai
	 hxqkuGvQWw47ibZ7IGayvafkwt05uCYo78bwwNrvLBTQK/NtNWYLYspebpzqJxCJHqkrf
	 12aYwEvAoApiNL8Ff90itMjlZb9Ei615TLfuFgYPO1iNzxfBS9Xbmop+gve9mCLNVaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=G9oB+AxP;
	arc=none smtp.remote-ip=95.215.58.74
Received: from mta1.migadu.com (out-74.mta1.migadu.com [95.215.58.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD35606A321
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 21:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD35606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=G9oB+AxP
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pdGcRI6mRAZu3eKXGCFrp/P0WULfVug72IxlaEEgoX8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794518961; v=1; x=1795123761;
 b=G9oB+AxP/P3yVE5KTFIkLtSzhpuBKvmQdQ/04ILsx2Go7e3vIjy0h2CkhR3XdR+FUzaLywlJ
 fGAl5L07C8EhcL+iFP15NPiYzwevdAzal9NsboKogLVy5zfEriR3Z5/dtBj14cyHldMSfN+UlSI
 6FfF6yv95sF82DZlZ6dnkyRA=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a2ab71799a8c4f41;
	Thu, 12 Nov 2026 21:29:21 +0000
X-Mizu-Trace-ID: a2ab71799a8c4f41
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 22:29:19 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Kalpesh Solanki <skalpesh942@gmail.com>, pkshih@realtek.com
CC: kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_2/3=5D_wifi=3A_rtw88=3A_skip_al?=
 =?US-ASCII?Q?ready_reset_station_in_rtw=5Fsta=5Fremove=28=29?=
In-Reply-To: <20261112131401.236433-3-skalpesh942@gmail.com>
References: <20261112131401.236433-1-skalpesh942@gmail.com> <20261112131401.236433-3-skalpesh942@gmail.com>
Message-ID: <F6D72250-ED78-4665-9F4B-5CF6D8FDAE96@linux.dev>
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

Thanks for the new version. Two comments below.

On November 12, 2026 2:14:00 PM GMT+01:00, Kalpesh Solanki
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

I think my comment on v4 about this got missed:

https://lore.kernel.org/all/83E3139E-BE19-4EAD-9BCB-6DABBF8D1942@linux.dev/

rtw_ops_sta_rc_update() can still queue rc_work after the recovery has
reset the station. If the station is then removed before the restart
adds it back, this return skips the only cancel_work_sync() and
rtw_sta_rc_work() could run on a freed station. Moving the check below
cancel_work_sync() should be enough.

[ ... ]

>       kfree(si->mask);
> +     si->mask = NULL;

As far as I can see si->use_cfg_mask stays set here. mac80211 keeps the
same station across the restart, and when it adds it back, rtw_sta_add()
calls rtw_update_sta_info(), which gets to this:

        rtw_rate_mask_cfg()
                if (!si->use_cfg_mask)
                        return ra_mask;
                ...
                cfg_mask = mask->control[band].legacy;

So if I read it right, for a station that got a bitrate mask, a recovery
now ends in a NULL pointer dereference, where before it read the freed
mask. Maybe clear si->use_cfg_mask together with si->mask? The mask is
then dropped after a recovery, since mac80211 doesn't pass it down again
on restart, but I think that is fine.

Best regards,
Luka Gejak
