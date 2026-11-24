Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509094;
	b=DyMMYW2K0kaHE4iMeQNQtlOYyHYT/gEuebRtT6LhGhSJnjglgHnaj7cD9QTj+VB3kCHC
	 xfv+RfjQkPMrlSeyvSh2BxctSR0ElsVQPMpSmwthrXuL+jlJDODL2B2PZYo/pfZ87ZjD6
	 w9sze5h2Oz5KwIKY/Cceg2NcRmjvjx3vjqIZNxmnMOOTWZ2/SS4QdmRPskuPajm7BASvs
	 ypsiFuOAESUJoXEpUlvkj88uxf5/8C88kS6N5CglF9CcO3tXWUJ8+6zOp5m+KGzIguICJ
	 ETvy61kWElz/OtFRlH207tDnq/k17rDp9mZwcVO7TEXJrc2fUqrn3WoVOcx7X4vCgLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XHQo84UDqtO6q2O2ZQYplON4CO/BMx7bnVbK5tRUoek=;
	b=MGmp98QBOZzDpYM2eEbP6LWqtBUMV727XJMjvB9ZBsuhTCzs2isJLbqa9rpaV/m0OwfY
	 OdLukEF5slby1IdBVOAqdNRgVMlMeyaWVk/YJxH1WWSJrm2wX9m/kx0rZMl+9lz2ivTQH
	 BFItjmLyyCg3Oemj0gHdprDmt5GzLpTmvAMuWFV32l0os0jF8QjtgwJvG/hSlHe7tTBOJ
	 CxVmmvMkHG8asvk/l2dSvXreyRj/2Te++SqEL/PzfVbtoYQA+SOqXhYXfWNSq1Ujqm+ny
	 QSxvrqead3QbyX75Ai93Duuo+KVKY9aO7QHgaaH7yOdVljxrTvJerJATFQzTjXkqzmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+56LR4e;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A29606A327
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8A29606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+56LR4e
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so38575615e9.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 00:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795509092; x=1796113892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHQo84UDqtO6q2O2ZQYplON4CO/BMx7bnVbK5tRUoek=;
        b=n+56LR4egfUrW9xjbZnV85Fy2dfEGpm6XnKbuS0OeJt6tPd0SD7qAjQdhPoMav3CHY
         y7+pGRTT5NVt2NI9d+jpCcP7TxX+MdXxBBaJz8hZYtlvocp9LpD8HwmOhfe9GfbxOMxz
         PFvvtCQga8I0WPerr+P7LcGqi2qUS7Ga21wGGI7LRV7M7VPATul8yqIxbEmpi+hG0vs1
         MB+5WZAlgsZaO7GBzq9jOlHEOx1L+3CQ8ZdWN5cHTEUkyF9JRsCh4IlGEzhlFIcosDLv
         JUMCj2AoADLy0wE9UFGEgLXVUn9yff2+jfoaUZJhC0ueOaA3nT6yiGofF4QL4O8dF5xH
         faUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509092; x=1796113892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XHQo84UDqtO6q2O2ZQYplON4CO/BMx7bnVbK5tRUoek=;
        b=Kd2hOx+MV9apQhbWZ/pwewcY5uziTMxtx1su3yCNLS+XQAEaveIfffoVv89X3QSqOI
         Wik5pC6K67ouOvb1hmZ5qSnJWdhXD/7E0ASNqT5CeyrpxvLcREA7ii6dO6XiJQGMGhAm
         Qx4aac96xwkFfSL6CUyJhbPDzLluWz7X7i5YgGC7osq4rWHGesOR2i50h+pBW1dakyfy
         pHflw5a3QSWe1xi5JOO/cCT/NDtTfRkT/9f42UK6y7WHNCWrpGbknILpcfenrZhktBsr
         +rgL4bt4dppgqKRMruKCbaYcuUdLDaFAfmmFEHZIcoRRkZo/hXc8/OF2NLWSlhHhSv+V
         009g==
X-Forwarded-Encrypted: i=1; AL+hErG7nXaJfPZmGcBnBNY4M/jMANhsCJ5Hdkz88lNzp78knfB+BYOhD42UCWQyrBomJu45wHfyKTjotrTJ86cMUQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8O8TDCTJywSXoEfHTYDUhI4gwQmyEh80PdAsRYwZ4QyHv5EKMX
	hr6gTF+tJj5siPWaPDpxH/LKCDzq+rnRcOctswgEX+6JWntjHJ5IDv1J
X-Gm-Gg: AZFdTZf3gkRaqTNxWpT4mUa6DEw6cfDqmqtmYw+Xnzr7Gtgl0TxYsKP8raFwGjnjEtl
	LXOTdpXe0Q0Ueti4Tq50W2q00kvKT+b6jvidWxB5G48w0mjdbmdFsFmGKWc+cGtlA/1mLSW4+i0
	JAHf3gkY02iuFc9LRFe/3J8YkUI+Fq9X7aVqZ+N/SM8KaBy9fx9eUVM6SXwdxYn6iDnr9o7IgbX
	UPejZ+01hENfCdsLWWmyOWNSOvMC7Eqr4J1R/MbiOaL3EuCU3TSpCSbWrkp23Ythq8yu0SngaDa
	OAdTWDhSczxeoRc4KyMWftdTUhfSTfmIBcCm/Zql7fGqXlXXO4m9HfqUgqTOZ6GZc2+BmQXCLfK
	yn+IKtIFcNZqc49JFUhbRMlVl3jJmkhc3mqFD5rJgFBrkaMwF4KS266CMbcshUkZ9o9ppa0C0BB
	GIXEkiFXK4ISHE0C4WVIVF6qooHO++I0xLHQNGdwXSHn+pZu6ZiP8FBIa8JvB8vvGAAfNk3fxSx
	B/XsJdFsb+4Ezfrqez3oEIGVsA08e4x7exKsnVHRY9crFBUTvZExtbtzKUaAiPk7lvC2cTEjR2f
	H9a4r10jPNEqOLTuyq0Jp7aWuoOTyxYU5BM=
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr269785165e9.9.1795509092042;
        Tue, 24 Nov 2026 00:31:32 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm419483755e9.1.2026.11.24.00.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:31:31 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v14 2/3] wifi: rtw88: support channel switch in AP mode
Date: Tue, 24 Nov 2026 09:31:30 +0100
Message-ID: <20261124083130.206249-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124002437.213112-1-luka.gejak@linux.dev>
References: 
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

Hi Luka,

> Could the TBTT pacing from patch 3 go in here so the commit that enables
> CSA also waits for that last TBTT?

The series goes in as a whole. I kept the pacing separate for review.

> Could the driver reject a template that cannot fit, or stop the AP if
> the download keeps failing?
> Could this path retry the new beacon when the download fails?
> Could we send the locations only after a successful download and
> retry the download if it fails?

As in my v13 reply: hostapd cannot request a beacon that does not fit,
and downloads failed only in unbind and crash tests. The other beacon
updates in rtw88 behave the same. If Ping-Ke wants, a separate patch can
cover all callers.

> Could we make sure the mac80211 fix is in the target tree before
> enabling CSA here?

It is in v7.4-rc3 and in wireless-next, which rtw-next is merged into.
It only matters for an IBSS left during a countdown and joined again.

> Could the driver reject this before it starts announcing the switch?

Confirmed on an RTL8822CE: mac80211 stops the AP at the end of the
countdown and the station stays. The AP then needs a restart, as any
channel change does today. If Ping-Ke wants, a check in
pre_channel_switch() can be a separate patch.

Mehmet
