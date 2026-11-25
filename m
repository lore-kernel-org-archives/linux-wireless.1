Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643436;
	b=L71iqU3+yKJ6ed8Lzgl4uPfeoNP4/jn0nVKxQv8crXKlGVxwv/LCeX/mdClEctYCXB9w
	 s/tm2mlSh3B1al1V6KhJfKjvu6YiEfAMHCtXwhLVxyfEbRkeXQ5Rj/spA8WBKndF51SrH
	 QCqYvyHp4nWmCrR62WBOUebBgCXcCUFL5IMlyjovrToE0oqcCEv3AmLCXXg4h6XHXng0u
	 C6i+kr04VDHOEPbw27imGhlTaARRRHA/vemyoGebmlUAhniATkhcpOvPvNIVffWPoe70o
	 Xs40mKylvVjR+yCxaFWnDqPCMabWrXbaZvJLhRBwyRjIA760GlLmE330Ruh7dtD0hmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643436;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=V+3TiGy3sSxyhaiGHLZNJdGYKiQc1BwWZ3abIKtTVCI=;
	b=B88aLxSY3XKgY3qaxXUOB2nV8i/pwY7LJtvy9tRMjBKcOyQAMOi0XTdtBEfu/PqoeOa1
	 66+Cb52o1oiz7V1PywECMh+gxj3/JvtsVQ4TPgnZytywlHNHMOUyIgO9g3Rx+x6Htrr+J
	 ZY8GehavMvHV0EdMtDzGBIfLuM5vDwfYLiX9N8rKz4dCjUzxYWg8oZ85V8r6fJyZuGBEs
	 plPO7KEOUtOqXyZtSfn5WLChbZdxZq26dn8d5wK+v3PeiDRFZn0z/lQGUj6+xuzmeEU0p
	 h5dLaYTDzcIwZ/fp/pN/V85zL6sxfTVMrjH8oGhc2uUqrwQEt24A3f9tUZMdUUqOVHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OjrH2Xb+;
	arc=none smtp.remote-ip=91.218.175.18
Received: from mta0.migadu.com (out-18.mta0.migadu.com [91.218.175.18])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B894606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 21:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B894606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OjrH2Xb+
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=d9tmaEDaam3zf5/opnl/lrNgub3N6fRlqVdGEjaEfQI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795643433; v=1; x=1796248233;
 b=OjrH2Xb+Y36X8lgVLhPVnVmhq892qzsV9tZfdthh+U9AVcBJnVSCJFxDvdjhbPYU6kpERP17
 VxZbyeqvB8t61y80miLYseQv/X6yxDA35vzjzg/lsAT01gaWPikvEXF1NilfYtrhqMqxPYkAluB
 H+Xfg5LYmB/KW/Mhe7a6RkCQ=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 66bb3235c50c3afa;
	Wed, 25 Nov 2026 21:50:31 +0000
X-Mizu-Trace-ID: 66bb3235c50c3afa
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 22:50:30 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: niko3x@proton.me,
 Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>,
 Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>,
 linux-kernel@vger.kernel.org, Ahmet Zeren <niko3x@proton.me>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RFT_rtw-next_1/2=5D_wifi=3A_rtw88=3A_use?=
 =?US-ASCII?Q?_the_rate=2C_bandwidth_and_GI_of_injected_frames?=
In-Reply-To: <20261124-b4-rtw88-inject-v1-1-f7457e496924@proton.me>
References: <20261124-b4-rtw88-inject-v1-0-f7457e496924@proton.me> <20261124-b4-rtw88-inject-v1-1-f7457e496924@proton.me>
Message-ID: <8E47D781-B1FF-4B2F-B0EA-AABA130E2778@linux.dev>
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

Hi Ahmet,

Thanks for picking this up. One comment below.

On November 24, 2026 11:32:30 AM GMT+03:00, Ahmet Zeren
<niko3x@proton.me> wrote:

[ ... ]
> +     if (rate->flags & IEEE80211_TX_RC_80_MHZ_WIDTH)
> +             pkt_info->bw = RTW_CHANNEL_WIDTH_80;
> +     else if (rate->flags & IEEE80211_TX_RC_40_MHZ_WIDTH)
> +             pkt_info->bw = RTW_CHANNEL_WIDTH_40;
> +     else
> +             pkt_info->bw = RTW_CHANNEL_WIDTH_20;

Do we also need DATA_SC when the requested width is narrower than the
channel? The RTL8822B vendor driver sets it alongside DATA_BW for HT and
VHT data. Here we leave it at zero and program the primary subchannels
through REG_DATA_SC. I am unsure which one the MAC uses with USE_RATE set.

Could we check that a 40 MHz frame on an 80 MHz channel goes out on the
half containing the primary channel, with the primary channel in each
half in turn?

Best regards,
Luka Gejak
