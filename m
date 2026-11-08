Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138044;
	b=JPI/+9QN/4vwaVEDmI29Ze3qXSNT+CxRyheLin07Mx3GGMjRxe+erh/SulB3383cKy9s
	 +nlBiJPOgjwez1ZHDRN5VolRaMWDgttp7y5cL5/zjqj13aoKPw5hVjBGEg7bEKYl6tDrG
	 nk2bAIAyKhazngFj191tpzJLwfkGr/HXB/BeKjDbSAUX/EPepsko4ZuYplbxVR2EfsQ7j
	 6C2ISd8y9IeFYHNkiqSldQPBhYmmtZuOAbmVHqJKFlP9KXKgSwpnVmhD2k/SKwlaCsrxN
	 +6EBk/NsSJ+WSTxpicPnX/YAsOALow6Y7LwiqBEynAVLyr7vVp/qgrqq3qhe8V7xpjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138044;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=zLnKlf5lHAvzQF0wN1jYdHTwzCKhgXL74j3WS82GZJ0=;
	b=AeWGw+SjOnWSHl9eN/15KuE5gEnoPxL02mq5X/JW8Z3si5mlyXCw+15+OlTwexUXHQbg
	 f1Kd0O+1+ZWrAC3IBWhSdQY/SJu7V167qE7g/1d2Coqvbi2qZmjRfv/IEU133EgxGFTEX
	 Dm+HRbdK5vdZ2PVO8demhVRNpyV8cqfOyqngXXkbmpQcCpXJm0/rDdxJdN7CowB30UowO
	 Ul5wES6nE1P+PZY3IFkPnnThh2xdSRYw0QmIa2W4EvYsKulq3NoZ56GYWBw/idXI8B0jB
	 WSP9//5Des3LgHGspKJgngzWDkA0tsyGSN9Ef5Y0Nor0jw3F8nYFMwDxek6cmCeZysA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bzWwwVJz;
	arc=none smtp.remote-ip=95.215.58.110
Received: from mta1.migadu.com (out-110.mta1.migadu.com [95.215.58.110])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA16606A31C
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 11:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBA16606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bzWwwVJz
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XewC+AgDeBK5Mip4i3uoUqEy860yN1DThXK/zmNhZtw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794138035; v=1; x=1794742835;
 b=bzWwwVJzdzSbxDiZBI7bEp6Ju9RpcTUkjogjEWDnWNv4j+abYvcgLmAVjkTsMTDfjNgGgO1Z
 414A7ReSw6itYUAyJ43Hv/w7BcAXMRnXiMcMej4SDLHjGjmcdGxE0czTOF0w8EeEmirT3GoHg0D
 Rw4NBgOnvHnix6v2WQAhV0wI=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a2ca078a8937925f;
	Sun, 08 Nov 2026 11:40:29 +0000
X-Mizu-Trace-ID: a2ca078a8937925f
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 08 Nov 2026 11:40:28 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <ef3bbfa6d9e2fc45c565c3a300da7b0fbd83d21a@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v3 1/2] wifi: rtw88: clear RTW_FLAG_RESTARTING in
 rtw_ops_stop()
To: "Kalpesh Solanki" <skalpesh942@gmail.com>, pkshih@realtek.com
Cc: kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Kalpesh Solanki" <skalpesh942@gmail.com>,
 stable@vger.kernel.org
In-Reply-To: <20261108085126.331784-2-skalpesh942@gmail.com>
References: <20261108085126.331784-1-skalpesh942@gmail.com>
 <20261108085126.331784-2-skalpesh942@gmail.com>

Hi Kalpesh,

Thanks for the new version. One comment below.

November 8, 2026 at 9:51 AM, "Kalpesh Solanki" <skalpesh942@gmail.com> wr=
ote:

> diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/ne=
t/wireless/realtek/rtw88/mac80211.c
> index 5e40cf06a9e3..7c86da9e9396 100644
> --- a/drivers/net/wireless/realtek/rtw88/mac80211.c
> +++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
> @@ -67,6 +67,7 @@ static void rtw_ops_stop(struct ieee80211_hw *hw, boo=
l suspend)
>       struct rtw_dev *rtwdev =3D hw->priv;
>
>       mutex_lock(&rtwdev->mutex);
> +     clear_bit(RTW_FLAG_RESTARTING, rtwdev->flags);
>       rtw_core_stop(rtwdev);
>       mutex_unlock(&rtwdev->mutex);
>  }

As far as I can see one case still doesn't get here, and I missed it
when I suggested rtw_ops_stop(). If the restart fails in drv_start(),
local->started is false by the time
cfg80211_shutdown_all_interfaces() closes the interfaces, so drv_stop()
returns early:

        if (WARN_ON(!local->started))
                return;

So the flag stays set after a failed restart, which seems a likely way
for a recovery to end on hardware that is really stuck. The next time
the interface comes up, recovery would stay blocked until it is stopped
again. Maybe rtw_ops_start() could clear it as well when
rtw_core_start() fails?

Best regards,
Luka Gejak
