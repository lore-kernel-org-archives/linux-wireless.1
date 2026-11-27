Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782278;
	b=MDqUwUSPd3WRDJICX7qDfNHSFUZq8I2a/nJCsl527l6Px/R6TAfFlGv36YNEvthgVQYx
	 MvIxz8npYcMradm/5rlk3Hziwh45tq4mJOrU04Lvc6QzK0A16g53hv0hMyAGh8YUUUMMl
	 vyew72QcC1NvPIu51H/1ArQiklz5HZxxCLPGuS496pEJhjnwDzUOEnBOqsndQn202Pljc
	 6UFrjai5+bkPjbMjSpnq1XR4YGNGA2/4Evs9h/E16PS4PPVXu9/c9SvnsXDcUIPMupGUu
	 OzDafPjAcLC/jMSGvW1+AMyTcLujU99/hc5MFFrfIS10kSrOPj46eJI4x1xhW+QZNkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782278;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ooAw7eHbmTnXMWW702N8U0swBBfiyfCOGm4Ne53xs2Q=;
	b=lhr+71a8+sCUe0LghLvTQxYwrN5MVOEeCe0BcvZ7DG3QJk1QhVWtRwQUroZ5zVxPwKq2
	 fPK0VwXLGryMqDi6Nr2G+r2HXSCXUSyRWcWj9/2wzHmk1O/4hYX0EKePFF8DZ/oYr18rM
	 4UdZR5M9JO0KDfcnuU/BVbMjfFRKpkCWx4mOFVrYO18nTfnP2O1Bb8SkYiKleSJbT7GeS
	 2zPSueas/QxIid3UtsDL3Sq/eUTPD5heDtGtgqw8Pra2iNTr3ROchFRSbJHoUW6dSpyJO
	 houlNZNugnAuEPnxDrZePFH8OUw1O9SS1CMKIEt+c2zjsevGmvjvyQkLzAJLKxxzZiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=KxtIaIQ+;
	arc=none smtp.remote-ip=79.135.106.97
Received: from mail-10697.protonmail.ch (mail-10697.protonmail.ch [79.135.106.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3F8606A31F
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 12:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB3F8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=KxtIaIQ+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795782275; x=1796041475;
	bh=ooAw7eHbmTnXMWW702N8U0swBBfiyfCOGm4Ne53xs2Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KxtIaIQ+/TtgqSmLn57bodayxdJhl38NxQW3GiisNMg4nZSWUCcG11PHx9hMBiBC1
	 hfNDo5HNtK8WO3r/wnMB5r/PEJTHG4S3y0+R5oqhpj+iLAcqVM5ARR2rRrXpmWlLi6
	 7GdCWTAvHp/wwrQeB8+ZXhUy8aGclYGmF1d97QtCUCUHXki4MO5OcWgKg8JjDE+lNv
	 /r6sDQ0OSGWhVUkTzlnhzYZNMLG1nWvbu86x18HLpozknpHAFDKdKIzYzibbanyaCJ
	 IibJfbBR9yvNBHFBpg6c+e/fSWCYblzdxA67QBqPhgUgjIjZx/u6EzmyOmbB5nAOxU
	 pqeAkW9HzoOhQ==
Date: Fri, 27 Nov 2026 12:24:30 +0000
To: Luka Gejak <luka.gejak@linux.dev>
From: Ahmet Zeren <niko3x@proton.me>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT rtw-next v2 2/2] wifi: rtw88: honour the retry count and NO_ACK of injected frames
Message-ID: <lUYU-yUlqcxAHvQlBh6eKKVYi7frkZ_fN2EGuKe-xAQuUw0yOq0pepH-cZ-u22KNcB4AsLP1dV7SqZ9puCg0e-tot3cyO-FKJws5WdwmB4Q=@proton.me>
In-Reply-To: <20261127115929.40205-1-luka.gejak@linux.dev>
References: <20261127-b4-rtw88-inject-v2-0-f9701b9243a3@proton.me> <20261127-b4-rtw88-inject-v2-2-f9701b9243a3@proton.me> <20261127115929.40205-1-luka.gejak@linux.dev>
Feedback-ID: 201311995:user:proton
X-Pm-Message-ID: 3f92139ac2ada6b06c4d58858d8fe282ecec049f
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi Luka,

> As far as I can see, ieee80211_add_tx_radiotap_header() sets
> IEEE80211_RADIOTAP_F_TX_FAIL for a unicast frame whenever
> IEEE80211_TX_STAT_ACK is clear.

Yes I missed that. It also affects rtl8xxxu, which already reports
NO_ACK frames as IEEE80211_TX_STAT_NOACK_TRANSMITTED. I think it's
better fixed in mac80211, so that TX_FAIL is not set when
IEEE80211_TX_STAT_NOACK_TRANSMITTED is. I'll send a separate patch for
that, tested with rtl8xxxu.

> For the test in the cover letter, I think we need the raw CCX result to
> tell whether the firmware actually reported retry exhaustion.

Agreed. For testing only, this prints it with CONFIG_RTW88_DEBUG and
rtw88_core debug_mask=3D0x2:

--- a/drivers/net/wireless/realtek/rtw88/tx.c
+++ b/drivers/net/wireless/realtek/rtw88/tx.c
@@ void rtw_tx_report_handle(struct rtw_dev *rtwdev, struct sk_buff *skb, i=
nt src)
 =09=09st =3D GET_CCX_REPORT_STATUS_V1(c2h->payload);
 =09}

+=09rtw_dbg(rtwdev, RTW_DBG_TX, "tx report: sn %u status 0x%02x\n", sn, st)=
;
+
 =09spin_lock_irqsave(&tx_report->q_lock, flags);

Thanks,
Ahmet



Sent with Proton Mail secure email.
