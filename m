Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381996;
	b=Xcgttr+ju6kL67ATYLEbGYWrVEzeGd2MWOjo1y+W+dJ7KbF+c8kImcqaKKCTgjlpQrRQ
	 uoQhvc+DszB63Ooj+4W5uidMs6rB9iX4LKig6SG7+0W33I/+acmOumA9acUV+Jdw18qKu
	 upjMGacAJYTTPhS8ZEYay6r999KnkKna21RO2MC0h2PhsURg79987i8LZGHw7Iv6WQyXr
	 svR19QFi/atB6OXHT47n77YKYSQ4xeqit42Z5lkfXquX9lGBo2sxT3fXvipFmoSC4VvYB
	 wj/posPKlDf3cMwuENHkoCopsDFqr7dC8wvQCXh70cTbTEDuVGJkBziCFAZc2UjA36Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0u79eAm9SL7rzpcixzShk17KsyWw74s1ML6HOCwCaJA=;
	b=yBndUdFw4ypE5vOGIZ9mn8c4hHuEWW4lBwqM36hoMuf41dJETLVmnf0CFnuD5reL4DsO
	 sBhP/Aiz0DpC5CRzCiScfdfx3E3AfoUdy1Vlceql2pOzF1QNYPuYbE9UiHilzSsK7BZA4
	 vU0MGuZi96xrEVAzmhryy5QTH1Fc+EMYU/1IOO6Bc78l2A41bj4ccd8GvFSTHIxzmpAHf
	 ZqGsK/uRkEHb1nAwBQ1GA/ZVmOrGUcFOD7T1wZICSkJ919XKP1kwi5IBq3Gd3mokraxGi
	 3PGJNamolPaLSjNLWHt/ejvRaJQhC3DSPvBFAc6IiZnmAKxmvMRDTtsWsBa7XKbUDVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hyoEPemf;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BA1606A31E
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 21:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1BA1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hyoEPemf
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso7008905a12.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 13:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381994; x=1795986794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0u79eAm9SL7rzpcixzShk17KsyWw74s1ML6HOCwCaJA=;
        b=hyoEPemfLzhtTLhIa0+BnYLQasi653Aeqcex26eZEtEAp4XpEg38aA4qQIDG4nQAOY
         YM+ohOHl1gYtdTDffqfXmNIJ01AO3MGfhcPGVtuEoUOBOHmPQisGgUNLWOs/uAoI5n2P
         OLeHtDFG6PgdsgdtuvS0Vlr+ALRh/8VtMcDXbyobL38ssMzkLr0+NPxvpWAJIXHd/4rI
         oKCh7w9Vd4HwoSO6vgOdBkM3SaAg7vlKlaAHIUayOozRgQcmlmsVIKbbNafYF3uaA0Va
         SSSoqLLYL6M6wKOUzeAqMtFxKhQHXSAEDU5oLsbIrZc2Nc0gYGN1v4yjdCtPixoW9zWH
         vvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381994; x=1795986794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0u79eAm9SL7rzpcixzShk17KsyWw74s1ML6HOCwCaJA=;
        b=Uc0ccvtMDYW7VIyePPgD6VxHVtDMOk0Sa3qNuXWN33gdY+IbPb969whWrWWwYfLznf
         ZcvDKDQ6VeFraz/mQuB8ixQtw1qCUyLW4xP5pm83taL/ciwhavn/MkMCSn6dBJ3Oyz1g
         ceLefynk+mKmMl33xP4mQhI8zf1y7V4v6nl1i7TMr3oczf4si5dxbW2nnYSd6LKmWKeO
         dLqhpigXf3g8Y7FdBmOP5OOlXu4TLPwPO8WdJM6hZwWqr+jD7QYOD6a1G/VVSScN2Gq5
         rucxAz1MjS7SAj22zEyKegujmGyovll6lOGB9qDnQvi7xmP9Rh0TITzOs989PMTqq/zT
         gDUw==
X-Gm-Message-State: APuU4Z8v0tibm1BK2gvPxBbUTqb37IrGVhusCDVlSc/zreDClZ84Pl6j
	urTwqua6MGJWJ9egmt8kBOwZmIuXwRtumgdz7fbgKjQ/DYQatJBGvmTArGykyMBCTw==
X-Gm-Gg: AZFdTZcATph+9EHYIITHNd3rdPBGGDKG2F8LygRHQ5XmdrDycrZ65/n9UYEtvJU1opl
	RMQJpA5WDKH1ueXH/CvVbJXeRhNewsFVnROQTTNAp8bq5Py61k0h717OdOa7e03KV9ejOaebXSV
	H0ouJhMAhFhrPCztadi1Cp8JtQriEuwlE9EsUY1iAi4V0VDjuqXpuqWXruWYJfNCr6BUXaPOLzu
	TljrUDO1kFOVeyaZdIbTiYx4AgbPZ9e25CD01RqcpdnnLVSiZdUndTU8fINBqfHDiTkVBXmCG4G
	fv4Pjmc7vOMhy1gu333ML9iyDI3Qar6EaDjr+AeMfGCuH42pXhGq5f0oVlPSnMxnvU1rXUI38og
	MJe65E0gUoluRqxKHNFKGAwirkxTaIqAMCMSwaTdEt5UikXcWO/PjsVSp5eZvJse9nWQZxNI7Qk
	Q8QH/aRrqqlNgukxnu4siD/559yY6fYRxamdf5w0I0oxScfxGryLnkYY4Q3aZCstrZDABsMYn57
	yLmsoWpJiDUGy/fiDdPBfxM4eseFqgDvqL+sI2PyCFvqFbs/YhD/xxpfBC1jomf3dZbT4kOb8U2
	zLy2SlAQUXV2x57iDbtaNRAgFKOdXVf4Ppv4rHfLPmWNWZofTktKVhKr89xD/LkTLWlLpzoYQo0
	lWS6Hfjm4j2XjEjtnEqH/yQEP23GE5f+LKQwo8/7HD7CFJArB3rMJUWRcMkHtqaCHaCCdkdH+s+
	2l+6iZPKihHIazGTfFggZcuAgwXzD+EFP8PycMmE7SbPy6hcXX2XHemor8LMb0UZvz0t+79aokH
	5JGqIvMlNP2KTJCPFPf37PFn6/lS5UPUNyx7i6ZdDWxFqhHPLaqDCIVE8V9fJhAAwjumRix/4dM
	C4tJ204L2aKuEmKmyCh3TO4zdzxaPuszQmS7lO4QRzLy9I0P99kd/M53CRvbvcb7mcd5dEnoig=
	=
X-Received: by 2002:aa7:da58:0:b0:6b8:6d68:23dc with SMTP id 4fb4d7f45d1cf-6ba37d51f47mr4295989a12.7.1795381994095;
        Sun, 22 Nov 2026 13:13:14 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d50069697652bafd0866.dip0.t-ipconnect.de. [2003:f2:4713:d500:6969:7652:bafd:866])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109b55sm4245663a12.32.2026.11.22.13.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:13:13 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	john@phrozen.org,
	kvalo@kernel.org,
	nico.escande@gmail.com
Subject: Re: [PATCH ath-next] wifi: ath11k: report TX retries in station statistics
Date: Sun, 22 Nov 2026 22:13:14 +0100
Message-ID: <20261122211314.2143272-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018171803.1545946-1-julius@bairaktaris.de>
References: <20261018171803.1545946-1-julius@bairaktaris.de>
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

On Sun, Oct 18, 2026 at 07:18:03PM +0200, Julius Bairaktaris wrote:
> ath11k does not fill NL80211_STA_INFO_TX_RETRIES, and mac80211's TX
> status accounting leaves it at zero because the driver reports no
> per-rate try counts.

Jeff, the patch still applies to ath-next 1983b40acfcb. Is anything
missing before it can be taken?

Julius
