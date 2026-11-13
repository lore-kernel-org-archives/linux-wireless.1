Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794553048;
	b=y0jS4g6qXPJHVk5JGYbQ4QlWqk+4LlAiEtZB5gxiKpiYa7ML1NA5eRDgt6IlEUoyoPqq
	 76et4kg6YGVjB9sKtTirxZKsc2VCJvfs7O8vVt1dGxVTts665kOv5Bwbc1ic/y9u/THjP
	 996kyJzNJWAmrPIBYp6cEqkjOvECSG7s1XY8XCrQOY0GC7ZlBhuP6Z45m6R1nn2zfBwKF
	 81xYcAIbgisgQCiAQIW3oyfeke/FLh9NOLMs3hMoOfZRWm0MpbTzvALv/bw3FlGgJaScS
	 gY0QbEDWq9ynUxZ1mO6vKcad86SRr6MeaQ4htxfLYFTSzBIWAEuUo2MkXPGMJyZhGvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553048;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TSIZ/NIMpDoAtTyHaUk17MQMdrZ8OXOHr5Xy7o+2duM=;
	b=Z0fqODIfLSD10R2uOAglqoGUhRs2ogj/IxlblP4nh/N5FrzE0gKbi2DssqWRoV6ZoEV0
	 7jd2SG+rBdqma4EINLrvVzxGe6k0esEj591FisT2tqysFez9sFCwKt78lSV6JOexvZqMq
	 43HA7YaglM8A0ZWyqyKDfvshLLQtceBzVaQFUnWZaMEsm0zAKGlzwtsvNaWpr9/nm/EXH
	 sZBFAkzdCM7DeqVuBDY8sSt64HWLN5u/HKyseOgXShIELfeORMS8hhX7fbTShO5XxVquY
	 4OSCO0mxmniyfeX6huLpRF4Qh5lmc3c1kdg/BskZej2jAgxiJ4QpdFgn5Wx9j8WmlGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZH0nOXPN;
	arc=none smtp.remote-ip=95.215.58.172
Received: from mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A491606A32A
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 06:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A491606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZH0nOXPN
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yLGnhnvrP+1DLPZgeP3cQbQNdkVKbbC/M18T1Cb2bRQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794553045; v=1; x=1795157845;
 b=ZH0nOXPNG3vdv4JA6zep7a07lW8iTvjTXSnXEkvghdU4vFeVdGIzbiUz7bvf6d7K3ATtD0jl
 OA9rLLU0iEIqlkNEm9PyYJLuLpmCKy9jqb8S5pbdYCiyCVegD62cv3Od6nVLtLxWg9cNbuSIqvY
 +g+247jK9qAfHFPwHcNi3nEQ=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b374c89bdcf8feb7;
	Fri, 13 Nov 2026 06:57:25 +0000
X-Mizu-Trace-ID: b374c89bdcf8feb7
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 07:57:23 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: linux-wireless@vger.kernel.org, Mehmet Fide <mehmet.fide@gmail.com>,
 Ping-Ke Shih <pkshih@realtek.com>
CC: Tzu-En Huang <tehuang@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>,
 Kalle Valo <kvalo@kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_3/3=5D_wifi=3A_rtw88=3A_reset_th?=
 =?US-ASCII?Q?e_stations_outside_of_RCU_on_firmware_recovery?=
In-Reply-To: <20261111213239.569224-4-mehmet.fide@gmail.com>
References: <20261111213239.569224-1-mehmet.fide@gmail.com> <20261111213239.569224-4-mehmet.fide@gmail.com>
Message-ID: <699D1E7C-1793-44A7-AF57-CFE16AD036E6@linux.dev>
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

Thanks for the fix. It looks good to me, though I have one small comment
below, but I don't think it should block the patch.

> diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
> index ce65a1a80840..8e7ae747b900 100644
> --- a/drivers/net/wireless/realtek/rtw88/main.c
> +++ b/drivers/net/wireless/realtek/rtw88/main.c
> @@ -664,7 +664,7 @@ static void __fw_recovery_work(struct rtw_dev *rtwdev)
>       WARN(1, "firmware crash, start reset and recover\n");
>
>       rtw_iterate_keys_atomic(rtwdev, NULL, rtw_reset_key_iter, rtwdev);
> -     rtw_iterate_stas_atomic(rtwdev, rtw_reset_sta_iter, rtwdev);
> +     rtw_iterate_stas(rtwdev, rtw_reset_sta_iter, rtwdev);
>       rtw_iterate_vifs_atomic(rtwdev, rtw_reset_vif_iter, rtwdev);

One difference to the atomic iterator: rtw_collect_sta_iter() allocates
an entry per station with GFP_ATOMIC and silently skips the station when
that fails:

        stas_entry = kmalloc_obj(*stas_entry, GFP_ATOMIC);
        if (!stas_entry)
                return;

For the other rtw_iterate_stas() users that only loses one update, but
here it skips rtw_sta_remove(). So if I read it right, the reconfig then
adds that station again with rtw_sta_add(), sta_cnt stays one too high
from then on (rtw8822c_cfo_track() for example resets its tracking unless
sta_cnt is 1), and the old macid of an AP client is never released.

It needs the allocation to fail during a recovery, so it is very
unlikely, and I don't see a simple way around it without the wiphy lock.
Just mentioning it, I am fine with the patch as is.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
