Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839175;
	b=tPvx9Om4Of14fKzRlCMRqw53VJK+BPj+ze22BRzPulW8zPZ2px/Hv8yPUaiUDe9ZaXoP
	 LJxl729rfI1OEEShzdSXJ1uU1xnsCIgrfQbIItts9TgFoXYTvpdau/coRpfesh4r6kia0
	 ZGBBm5y6DcMjYi7Wgvv/lMlnXzSvVtoR0bXR1wqjWVQ+nRWFMFIAdi81egiY0OSM3H/o7
	 Ai0ckt56LwucNZCcHF58kCMvX5G47TKz1t4Lyvw1n3dLu528gIP0UGWWBOgnpqlQs2LFF
	 tIhAc3/yFtT8AQbcTGWQkgouz5eikOE6rHwqoOMvsHsedI1VxSjZZW7ArXsfbDmdeUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839175;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9v7IDc0XEQ/Yk1qnAZPnPR4yqpr5gQdLDRALdUC+Ed0=;
	b=MmkQks1DXZvOMRiR81lw6twTLAVwUubGcVJo3sHM8TBZhCDvVrffIZvoMJSyLmZsv50p
	 wWOVqECuVw9aoHIim5ctOE26bpOMf2412GkSADqJhMX2PnkYlFrC8CXP5PZQQw6rGvJcG
	 Pf37bu76ML7zh7QMbrIKYukRQ2LrklIqlTohWn6C0T/yHuTOYTcIbctbkgsSp+AtjzS/t
	 iN0RTtR9x9e92h+WFMqfN6VfjaXCcJwQIflfxBiuuJ/OzywT/I0DYb8zgeTHCJnzkV1EG
	 LJKOoQbJ2kqd+TnI9Gxw5CLdh5gwyqoolUQHgJU3aCDd3rU9mhIb9OIKFqkulrEizRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=t9me4bv4;
	arc=none smtp.remote-ip=91.218.175.157
Received: from mta0.migadu.com (out-157.mta0.migadu.com [91.218.175.157])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982EB606A33F
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 14:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 982EB606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=t9me4bv4
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IuGJsoC0pmJAX6hry79QbatSHX6/kXJiJDDUCZT6m6w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794839172; v=1; x=1795443972;
 b=t9me4bv4F06LjfbJh74ndc9WUKFiu50R4lG8dIqxVgk7JHQRbCg2GOxvfAJBCt1ugamYP5Rk
 8xBiPdVXUVBc5iHpvPZRXzJCKqbweL4jBHW62bC49wjVWajTpgWuvwWmQ+NKsBEWEFpa/9HmqQE
 bMa5AOzt5FQ/Rft5pR07PEbg=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4054c6750560ac8d;
	Mon, 16 Nov 2026 14:26:12 +0000
X-Mizu-Trace-ID: 4054c6750560ac8d
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 15:26:12 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v11_3/3=5D_wifi=3A_rtw88=3A_?=
 =?US-ASCII?Q?time_the_countdown_downloads_from_the_TBTT?=
In-Reply-To: <20261116071952.1142013-4-mehmet.fide@gmail.com>
References: <20261116071952.1142013-1-mehmet.fide@gmail.com> <20261116071952.1142013-4-mehmet.fide@gmail.com>
Message-ID: <781999FE-B0CB-4D6E-8A1B-06A38082202F@linux.dev>
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

Thanks for the v11. One comment below.

On November 16, 2026 8:19:52 AM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c

[ ... ]

> +     rtwdev->csa_tbtt += interval;
> +     delay = rtwdev->csa_tbtt + RTW_CSA_TBTT_MARGIN_US - tsf;
> +     if (start || delay > interval + RTW_CSA_TBTT_MARGIN_US ||
> +         delay < -(s64)interval) {
> +             /* at the start, or the download ran too late: the next TBTT */
> +             div_u64_rem(tsf, interval, &rem);
> +             rtwdev->csa_tbtt = tsf - rem + interval;
> +             delay = rtwdev->csa_tbtt + RTW_CSA_TBTT_MARGIN_US - tsf;
> +     }

[ ... ]

>       ieee80211_queue_delayed_work(rtwdev->hw, &rtwdev->csa_beacon_work,
>                                    usecs_to_jiffies(max(delay, 0)));

Could the first count still be replaced before it goes out if the first
work runs late? With patch 3 that work is also the first download of a
CSA beacon.

For example, with a 100 TU interval and a count of 2:

        first work due:        TSF 112400
        first download done:   TSF 224800
        csa_tbtt after +=:     TSF 204800
        delay:                -10000 us
        next TBTT:            TSF 307200

The delay is not below -102400, so this queues the next work immediately.
The download just installed count 1, and that work can call
ieee80211_csa_finish() before the next TBTT. So if I read it right, no
CSA beacon has gone out at all, even though the download succeeded.

I understand skipping an intermediate count when a download runs late,
but with a count of 2 there is no earlier CSA beacon for the station to
follow. Could the next step wait for a TBTT that can send the first
download, including when the first work has missed its scheduled one?

Best regards,
Luka Gejak
