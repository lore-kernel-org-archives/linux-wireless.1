Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795867702;
	b=C5+aeMZ73OmHmb7m2Fi+rVzDi/4UDBFvVc3O/8y4+57Da2XPmoIPw+Py6XjT5/7XzOn3
	 46U8XDzkve3Y06DLMx/cCc+JWw0vGE/no5YCLC4FrJfkDCvsSI47ntlV3tdsIzVunYuS+
	 LNbl+mYcRj/UysslVoYz3wMARHwjKdq4NkiXtBI7wlsg+i6miugaPGXXtplxq/P7LOCya
	 KV4fJAeXcl+CI+4IyOpHcDIJX0NONmOJ8OYIetRLy6Vm+nscB4/Pc2M8+z39Z+2jgf8f1
	 29Jj9o9YgYgY0nc6oHbg+WMKy/ab5xUACoqNXFz1Eo+pSff5HCwZ3KseUR+3wwv+wSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795867702;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ODl16E8KXgfksgXPCf1teoNDDtT/w6wAcEpA8bErby8=;
	b=pueo76JR208UoDnSibk8a844RSFU9He1aqR0iD1COTFeYgC3PDbS/h24H/CdMBXdhr/O
	 Q+N2xrjQ7iSb9EH1Ce6XPO/MefiReh1EjgFKUre4EZLLFJBg/xZnTUJ5L9Cirqg75KGlZ
	 J88q65DdUMIfqXMrHDYVvYiIYree1NFqSib3lGQydaYlwyiGdIsHf+KbiTLW+Jiyx4xe3
	 xnk7v/DtVbfB9gMMJ49tqraGnxhTsd/pHoL00vp45FJvOR5v9OejdhQ7tYU+vUvjHdMBj
	 kocG8fy+7oZPyuYHtYONeuyVZTtt77GGlHyb0AqHmPA5Te9Vr0KjDXqynbC4KilU+Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lEpsgMY0;
	arc=none smtp.remote-ip=95.215.58.226
Received: from mta1.migadu.com (out-226.mta1.migadu.com [95.215.58.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628A6606A31F
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 12:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 628A6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lEpsgMY0
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=z2McixSH+wdtJom92EHTKQ4A+3QLj1zEhPo1ydXwJXA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795867699; v=1; x=1796472499;
 b=lEpsgMY0aC39WPjE23/cfJq1BtwCzcBxGKhVKbFj2QzXr8/QZa5eEDeZViFex+U5VNwOwFgM
 XeJ4RMEqo8fOAs7JeuftZOKSUXJTJSBEJrG+HI6Odx5X34Gbwp3UMBnuFKwp29S3XNSeR2MmYYA
 tSAqu4nvgyANN1Qxty/0xMvA=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dd07eafdd2a5ecad;
	Sat, 28 Nov 2026 12:08:19 +0000
X-Mizu-Trace-ID: dd07eafdd2a5ecad
X-Migadu-Flow: FLOW_OUT
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v15 2/3] wifi: rtw88: support channel switch in AP mode
Date: Sat, 28 Nov 2026 13:08:16 +0100
Message-ID: <20261128120816.36110-1-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071858.42275-3-mehmet.fide@gmail.com>
References: <20261128071858.42275-1-mehmet.fide@gmail.com> <20261128071858.42275-3-mehmet.fide@gmail.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mehmet,

Thanks for the v15. Two comments below.

On November 28, 2026 8:18:57 AM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

> +		if (rtwdev->csa.count == 1) {
> +			ieee80211_csa_finish(vif, 0);
> +			goto out;
> +		}

As far as I can see, the AP moves to the new channel without the RF
calibration it gets in rtw_ops_start_ap(). The channel change sets
need_rfk, but rtw_chip_prepare_tx() is only called on the managed
station path. On the RTL8822C the watchdog can then adjust DPK using
the thermal values recorded on the old channel.

Where should we run the AP calibration after the retune?

[ ... ]

> +			    WIPHY_FLAG_HAS_CHANNEL_SWITCH;

You confirmed on the RTL8822CE that when the station stays on the old
channel, mac80211 accepts the AP switch and then stops the AP at the end
of the countdown. By then the AP has already told its clients to move.
Could pre_channel_switch() reject the request while the station still
needs the old channel?

https://lore.kernel.org/linux-wireless/20261124083130.206249-1-mehmet.fide@gmail.com/

Best regards,
Luka Gejak
