Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794552886;
	b=zAt1nLtgIoorhjotGwIN0OLUgOl4Oc3FTgTowtuRIzPH7teSYZNPp325ajT+JaFrdWkT
	 e78O3/3GbMBZSK0EmVibzbj8kDUCIBn4d3jo5ClBuhAZoJF+yPn4bwQ41eB5QHk+sHaDL
	 wI4JZxiuS6XESLPbveJLcFjcfO+tElbYAvrJzFsJ7mHE+8eZySr5Tl8Z9Xdk+bCT9Jto4
	 8TSe8kZSJgoPuMNLAmghNBICYHUZz/Hfpths+ZzoB1kSvfAr16olEAYL0Z73/T6PxjO14
	 asLZjTlHKSk5DxsO+d5U0/KWVgoUK6DWwoFStP9s2IrlfQvYO9uDmkjPp+RaBtLomWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794552886;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=R2fhwLvHTy1x0CH3Us+GlmFnqE7m+FoayPcluGQhNk4=;
	b=odzreIgXYl5JqL4/ZJUMf6syP7xpGTiKctnnyd4bVkdczRWK09EfSVeoFLfK0sfDcApM
	 gh3ZUfRnMWzN5UnsAyhDQj/iMaHv1EB/ue7+UOYfejWdxnmeMdd8k/XiV0iJTQjn8/oQj
	 hh6eFnm8+ty9enAV58ppHmelltJMIlX8R+39Cn9JlgHjWt1jADNKE4BiaoAfCrtl6kh6I
	 e710Cqj1Rk6i9dD8RvNd8a4UEQmq2FnDOBbJfBfFcve69exF5xK1lN7oYm06eDJwKgfFC
	 bex+yWatRhWcwtQQerb8ZKwiYX1GY3rfIrAhDRMWhxa+4vcNzOna54Uu7qg4J6Lif5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d9VC2BA2;
	arc=none smtp.remote-ip=95.215.58.115
Received: from mta1.migadu.com (out-115.mta1.migadu.com [95.215.58.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638E5606A321
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 06:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 638E5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d9VC2BA2
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OsS3qsQqkiRhs5vCMH87Zrs/o6a3Yg7xoB13t5bDoD4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794552883; v=1; x=1795157683;
 b=d9VC2BA2Ksc1SYEexOYvI9NbFfuD/9nfwxBBhF+mNKQLkVqU2gSStA4WlHVhf7nFXBFWwzuQ
 k8O0A56dcZDb5ubBDi3UcyHv21/DbmvNbaUQeZUNTUH+JRuPAXf4sMhzwxy7hGyqKV5Q4kdf7rD
 KDsPmJq7QnuxL04lT2fjBqUw=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f6a10e7b9b8e81ff;
	Fri, 13 Nov 2026 06:54:43 +0000
X-Mizu-Trace-ID: f6a10e7b9b8e81ff
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 07:54:40 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: linux-wireless@vger.kernel.org, Mehmet Fide <mehmet.fide@gmail.com>,
 Ping-Ke Shih <pkshih@realtek.com>
CC: Tzu-En Huang <tehuang@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>,
 Kalle Valo <kvalo@kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_1/3=5D_wifi=3A_rtw88=3A_free_the_re?=
 =?US-ASCII?Q?served_pages_of_an_interface_on_firmware_recovery?=
In-Reply-To: <20261111213239.569224-2-mehmet.fide@gmail.com>
References: <20261111213239.569224-1-mehmet.fide@gmail.com> <20261111213239.569224-2-mehmet.fide@gmail.com>
Message-ID: <7DDD0FC3-AD89-4819-8058-15DFDA7E5D6D@linux.dev>
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

Thanks for sending these. One comment below.

On November 11, 2026 10:32:37 PM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
> index f7708ad17b6f..adc54b063382 100644
> --- a/drivers/net/wireless/realtek/rtw88/main.c
> +++ b/drivers/net/wireless/realtek/rtw88/main.c
> @@ -627,6 +627,7 @@ static void rtw_reset_vif_iter(void *data, u8 *mac, struct ieee80211_vif *vif)
>       rtw_bf_disassoc(rtwdev, vif, NULL);
>       rtw_vif_assoc_changed(rtwvif, NULL);
>       rtw_txq_cleanup(rtwdev, vif->txq);
> +     rtw_remove_rsvd_page(rtwdev, rtwvif);

As far as I can see, update_beacon_work can still run after this reset
and before ieee80211_reconfig() adds the interfaces again.
rtw_core_stop() cancels it from rtw_enter_ips(), but rtw_ops_set_tim()
can queue it again right after, for example when a frame for a dozing
station gets buffered. ieee80211_restart_work() then flushes
local->workqueue before it calls ieee80211_reconfig().

So if I read it right, with an AP interface (ap_active stays set) the
work now finds every per vif list empty and runs into this in
__rtw_build_rsvd_page_from_vifs():

        rsvd_pkt = list_first_entry_or_null(&rtwdev->rsvd_page_list,
                                            struct rtw_rsvd_page, build_list);
        if (!rsvd_pkt) {
                WARN(1, "Should not have an empty reserved page\n");
                return -EINVAL;
        }

Before this patch it built the page from the stale entries and did not
warn. Maybe rtw_fw_update_beacon_work() could skip the download while
RTW_FLAG_RESTARTING is set? The reconfig downloads the beacon again for
BSS_CHANGED_BEACON anyway.

Best regards,
Luka Gejak
