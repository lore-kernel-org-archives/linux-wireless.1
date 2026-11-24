Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512480;
	b=At6Ny7fPkQoO1fzhtj3U9FMxHA2Rvs0WtobJY1X8Q2ulS2HmWF+/ubaD6fN5w2Atuj1e
	 GDlSs5WR+BgK2SXzgJGeKqWdrT4ysWnvxohqvX6BgEl0sp9LjjkaaIB2+tzJx1zm/2NG6
	 euwS5UcpXqy4HUE45O7osEnDgIPZZNTSr9qz4SpLtba+knkAGa5bS1/JF0rj84VlBRQFT
	 Zb4IUSRxtrGeNZHLZt03/1cBmuIB0E0yeeaOKci6Gl3MVkncK54TW3ncW3D/biyPS6VmL
	 UYpEYHSmLM4ABcJ3uCVMYGjW4RO+zZZ9vBSN9dwS54LivCyRXgCKP+B5TjgS2sopQ+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TWHNEL++1iAc8xuUz6pXGuwhXqWb9DFmAWCQn+tw8lw=;
	b=TbKtUx2dcfi7fOjIvugRj9Y2vi2HovNgv1oZ2yRUqSvaqdZDrmy50sTUtqXmAjMSuCbc
	 +5oWONHkuO5f+WaL7U/vh2krwBEnZj1BtcjnnBZAvD5sLjD2sIjiPvGZkworVAI0H8IwB
	 KB0VA0gfyBHglxWr9xS8YS1w/Brq2DmgpbpzxOnfpDDyqKvnwAyPzUeNgR3wsN5Y3dly+
	 +zVnSiFALQ//hi2cU/CN+vpZeaB45f/3pmsSGZRP8hsB8b6vaisXnfTFPNqGE9EiX/9WV
	 uUlQClq1sCZ3DE4qHxfCQ5zvd4tjpqoMiiWI0eSUH3q5IwKoDHCg7gTXma2bkxb5FOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=krel1Mzw;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD49606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 09:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BD49606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=krel1Mzw
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so3523473f8f.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 01:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795512478; x=1796117278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWHNEL++1iAc8xuUz6pXGuwhXqWb9DFmAWCQn+tw8lw=;
        b=krel1MzwQ3o6GDc3R5qx13RZMJumZpXH71QSH9vKpM4ufGRROwg4GKcKX8zyAU+HDX
         VRbV/kH5LLlV+nvXM4vrtEzzo7Ov1LVJFAhLv7bBXYCO8CSes0mEDk7XHgXhdwfksL8K
         5B7IwQLkSP6eTVemubwDyuJ/vyxFoc3IP+Vv3rEjH8unDPKal0eUPU31zvhqEsgecik7
         zD1aYd6+nEtwP3kQmcf990YHSRzAGVkL/Gm4iCtgSp5EJYidKtpGjk4u9/chThQrkmZZ
         a7srxP8YmRef3Rzn1Oa6hzwEsrslsw1A35VkQQHVbUiCE5MyS285TWd2YdelhQlFObR5
         grKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795512478; x=1796117278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TWHNEL++1iAc8xuUz6pXGuwhXqWb9DFmAWCQn+tw8lw=;
        b=fjRwD90+d9PxKlubtri0/rLUAQLUombmae12bmejr/NqeSNStFWYbgSScX24WRobtJ
         yv4zpao6SWC9A4bffvbzWjBQoFwBErhia9hXa0TbrkUIs6W6xkIeECYuX8N1w4yRIwD1
         kbVpL3VOrcTtnl3W6gIE4AC6dLU1UYNEKChzfVDClPcWdDJ2ayiKfpWLWFbbJvj7ljRJ
         /WaIxFkKn/SuUsnOln/uGT0sos6x0O+TNa5dzREaIx0xFnQhVOp26nFZLPe4qpTvN71K
         NGOYNiF4BEwC8wgQNy730kR2Hn+W8clL87C8tyEKismAgSs0ARH7Wt6aF9vHjnXwTQVk
         cm7w==
X-Forwarded-Encrypted: i=1; AL+hErE45lLGbqhktm67mhLb+Cz6Iy4zaRONvIuKe7qWwpl5fPHDHTMJBOM+CTpOGn7wqgLoVGhH3fiWFYoCHukdTw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8s7FypGZxNpg1rfdPROBlRnnqEiohWk+V04GDlH6nlkwayvjHF
	+odrnYfipAcI01ogAxdkg+vyGU9BHyfMDnju4EWDchLRKCZyAq9644iP
X-Gm-Gg: AZFdTZdgp83vG7iWd6jh/Bafx+HNRHcstp00Vvn/wK+hXNd6G6OdyOyuD3LshKJmKEs
	4DaWvYokD96SIJYrM6F9/ipIlE4UpyLpGftPhGq+l0z/pxoc6ro3XkqfzDCJnJlrmamjiE3H4bG
	w2np+8e5gxMzuXWz1iaFLE1GmoKYuJIx/We2+2RJUjj98KflTFrwI4+zy7oJbbfZsmbhLoV1y8E
	3ROcxwoaCe2xiKxDPuINyWY9MJhmQEXndwrsDfcKP35qHv46kC7PMDzSApkR/MlO89yPLeatbgl
	Crnox2WZTx9AyFLyjaSziYdYw+2K5qfm97kZGd8YcQZCQuknbLefB27rBrNFTtyVwnUYxIi8C2W
	vO/eMqbu3cTid4QfFxAjSnoZh7rtslOjIxUloyjP8IAka++8CQBI8i9C/upPkSIEWPzN8mVjImq
	ssfDBdgzaQsbbKtw9/Roe6TmRb56e3bCRb5xc6/elMnk53bfTyCfnIs9dDRpXYpcFBpdmN1p64Q
	hAALFiaEtd0TMvnxlPuehCzXcyMAJl8LhWyCQGlm7Cc3w9rP9v3pdvmlmjr5XNk7qw2Ed5Ld57A
	sAOusO8B8hNnotQnur9OP854C3s5wINZIxw=
X-Received: by 2002:a5d:5888:0:b0:487:1ac0:32af with SMTP id ffacd0b85a97d-4abb47b0fb1mr27082941f8f.51.1795512478103;
        Tue, 24 Nov 2026 01:27:58 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm26445202f8f.20.2026.11.24.01.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:27:57 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v14 2/3] wifi: rtw88: support channel switch in AP mode
Date: Tue, 24 Nov 2026 10:27:56 +0100
Message-ID: <20261124092756.211244-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <243260ca062b40ba965eece69e5c52f7@realtek.com>
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

Hi Ping-Ke,

> You can decide if they are necessary. As I mention in another patch in
> the same patchset. If you think that is rare case, just reply your
> opinion, and let it go.

Then I will let them go. Both are rare: a failed download was only seen
in unbind and crash tests, and the AP stop needs an AP and an associated
station on one RTL8822C. The same holds for the minimum interval in
3/3, as hostapd uses 100 TU by default.

Mehmet
