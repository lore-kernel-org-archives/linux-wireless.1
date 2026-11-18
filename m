Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989986;
	b=m8BsFMMC2qgtgpTCr5aKh4QQdKltAjJvYgam8zyoaFcdEEROtWp7ul7gvguu0F3KZVMJ
	 1U1P3aAPOC6IEH7PEuqxk8OSQqds427QKhCY6JNsiCDpSgguv1Ue0i8+rkFFVDrvWc45n
	 3/HVnPUaigxST52ie4eFEgOvNJvBjUxDmOCCKbkTOiEJYq2TuM4+RGG/1osKM7dZPpfQi
	 /hseuEr83oke/vz/H6I7R7cfczMnhfRRKiUM6qjpfTxaXFnPPEt4Bq1Ve3N2r0+KS43LP
	 7G5f1mY6296kituHqQT9dlMT5LM0/voQiq1yJ8UsZxGqrV6u3tnOJ8LJD8OXbtsbGxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989986;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EUug9EhHnn02oR/iLTLhfO3Tu25qBjfgSKtYg+eIcHk=;
	b=UJljAzCypdxYzi0U6eBgGAKfIbrwqBF518XM/Hr+vOzaLR8KJ7yI7nH8+FiaA6hfaOgC
	 gmEXdQ8HugisdtulC63y0vqRBeGjfYt+RLPQaT2W2Qgup8pVyxbs2z6+Hj2rotjQRxoIE
	 qUQ1XfGkaj50eZF98uZlrfsxz5e6nB0DURgmS0UxZFUVgfpqQft+u7CLyE+w/t4kZoFT6
	 41BkI/K584cwrjxPl5X5mzmHBRD0/bEbuuNBEXcWun+vVZt2HZuuxwM2X41JDPTyGithw
	 /PoGdVlug2PWkbNTBSrRNao68uRVqHvX8pAZc1eHojn99AMo6Op5sxI1t1GKalhiEmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="gJw/fRUS";
	arc=none smtp.remote-ip=91.218.175.172
Received: from mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8BF606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F8BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gJw/fRUS
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ytzQ5XeBidt7fXi1H8oh5svqQ3UECQimFjn0eSE7LFU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794989984; v=1; x=1795594784;
 b=gJw/fRUSHazv8IchAHw9WuTr42/RAqmI2uxV1TvMlRcMDUSIONvrZ7IZSPbh9L6s7EKNbSDN
 eGtEOQRMv68TjiUlPJeaSkxrzuHy7225xliTaonYo++R9pZCTVUJI1SbmUIyc6iyL1BJ3gd8LA3
 2iO9Fc+eKkKSiuylEkit7B5E=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 523ac45decf7a92b;
	Wed, 18 Nov 2026 08:19:44 +0000
X-Mizu-Trace-ID: 523ac45decf7a92b
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 09:19:38 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v12_2/3=5D_wifi=3A_rt?=
 =?US-ASCII?Q?w88=3A_support_channel_switch_in_AP_mode?=
In-Reply-To: <20261117232624.1956815-3-mehmet.fide@gmail.com>
References: <20261117232624.1956815-1-mehmet.fide@gmail.com> <20261117232624.1956815-3-mehmet.fide@gmail.com>
Message-ID: <9BC4FC13-5723-4711-9798-11E3C285C7F1@linux.dev>
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

One more thing in addition to sashiko's comment.

On November 18, 2026 12:26:23 AM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

> @@ -493,11 +513,17 @@ static void rtw_ops_stop_ap(struct ieee80211_hw *hw,
>       struct rtw_dev *rtwdev = hw->priv;
>
>       mutex_lock(&rtwdev->mutex);
> +     rtw_fw_csa_stop(rtwdev, vif);
>       rtw_write32_clr(rtwdev, REG_TCR, BIT_TCR_UPDATE_HGQMD);
>       rtw_write16(rtwdev, REG_ATIMWND, ATIMWND_DEFAULT);
>       rtwdev->ap_active = false;
> -     if (!rtw_core_check_sta_active(rtwdev))
> +     if (!rtw_core_check_sta_active(rtwdev)) {
>               rtw_clear_op_chan(rtwdev);
> +     } else {
> +             /* what a countdown may have held back */
> +             rtw_fw_download_rsvd_page(rtwdev);
> +             rtw_send_rsvd_page_h2c(rtwdev);
> +     }

As far as I can see, this check can still miss the station.
rtw_core_check_sta_active() uses rtw_iterate_vifs(), whose collecting
callback skips an interface if its GFP_ATOMIC allocation fails.

If the station associated after the last countdown download, its page
update was deferred above. Skipping that station here leaves the
countdown cancelled without refreshing those templates or sending their
locations to the firmware. There is no next work to carry the update.

I think the presence check is better fixed in
rtw_core_check_sta_active(). Its callback only reads interface state, so
could it use an atomic interface iterator without allocating entries?

Best regards,
Luka Gejak
