Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750216;
	b=0hAYOOi4fccah9ugIp2jL0KlXUTo+0Z73XIfDXMPd+gFlnzzieVCZSiMqObkbuub0Tl5
	 cUHeERQDhJSPVCrNquP79ChYKJM2TJK/a3qNn0d/RMIaO97VapWESdSKjMgnPeqfmzoKJ
	 B2Dfa5GuI7fB2UUrRFsFNpE7XAYrQ8zC2N27o9dcOj9/VISloWsw+q6CzbDFn82oUY9k7
	 eQOrjazqLfe5OLFEx6s4Ugc2ksDf3fgKwCefbNx1LezouZiPgHZj+FVChrvHh44I/PmHK
	 YFbwdLW6zhbugzBY+6mzgAQWI0O7QtAH9Y2IWAIRXj+IOpC1PGezYBqwsLHv5S/WpMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750216;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=r1BWchFZ0F6U4eL8O5cOuqHAnPS3YQCASCANNaxwnwE=;
	b=4CUcAxZP2eL9gPYujbUGLspwy+NMjYDfeOAaCC6my5bisxxiM/8Qus1nPZPokSMQsRMh
	 Wzjt4USHWsWG29eOHlxZctCvvq5tUXIBtLAQ4M8wxUKL3eCfNzop0dT4tzINTi3h5yeIJ
	 +sX8IOFo94LYNLXDvRPdO26AyvWNVrKno9W60Yg6gpwk8GXhBvAK4QCvp2K7W4tw+uTkT
	 1rtSpuEFdSHYlP0gb17xQ59a4D+vaiEWT3hk8Yy48ROnyeFMNc34eYpOVAMYcP3TZVyXi
	 PL3JstH7MqCZ8ScHoR6oqJMYp8GVGvTUvr+vh28gBc96M5oA59wNyF59qXzRtMfqAGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=spfOm6x7;
	arc=none smtp.remote-ip=91.218.175.104
Received: from mta0.migadu.com (out-104.mta0.migadu.com [91.218.175.104])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2797606A31E
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2797606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=spfOm6x7
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=r1BWchFZ0F6U4eL8O5cOuqHAnPS3YQCASCANNaxwnwE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794750213; v=1; x=1795355013;
 b=spfOm6x7sfenH13qNLn8ER6w5DV/ryfpEuDUr6k65eZ0IyHssOKHvWFKP5H8wSFHWD4aa2IL
 bnOOtMo4ckeH71SbJnOt4KCzb4y+meL9n+3rII5AOGVdALJhDiSNfSAo4iGeM8N02QQ3iaQqDfC
 gk5ehHnQbHaRrLv0eWS9908E=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8dc64cd74b0b1ec3;
	Sun, 15 Nov 2026 13:43:33 +0000
X-Mizu-Trace-ID: 8dc64cd74b0b1ec3
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 14:43:32 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4_7/7=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?12a=2C_8821a=3A_respect_peer_A-MPDU_size_limits?=
In-Reply-To: <20261115114336.1739863-8-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com> <20261115114336.1739863-8-hjf3108@gmail.com>
Message-ID: <68091FA5-A6C0-4485-A01E-E1D3C2132552@linux.dev>
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

Hi Jie Feng,

I have one comment on this description as well.

On November 15, 2026 12:43:33 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> Honor the peer-advertised receive limit for transmitted A-MPDUs.

Could you mention that these chips had no set_ampdu_factor callback, so
rtw_set_ampdu_factor() returned before programming the peer's limit?

I think it would also help to explain that the new setters clamp the
factor to the chip limit before updating REG_AMPDU_MAX_LENGTH.

Best regards,
Luka Gejak
