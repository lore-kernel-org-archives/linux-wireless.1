Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794209137;
	b=OFx+VINkfQDWTHc225P0S0unuWLA/vGQlkbRQ4yCg28pCHGwuOYKK6iIG2tSlZ8+BE5X
	 uSs1UzYiGTwPgMsxJLpkhfij4zaJZ3Fz5C5sQEZ2zRwHiovNSmyeh2gQFyKvKYB1++Ix3
	 QxukMG2lrTpEJZ9bzVpdBHNrzdsESa8/0aIB5aHK/PpM1u1b5sRzYbKJn9XbGYV7zvy8y
	 EzBm1sZkuZPc3tF9+KWA3N1V5ktUZe2fn0QGnOpk2uLzT3XVWz9uQJn9SIB9XoSs7WaKE
	 9rcHFzEuSg/u/NpvtIvL2FGfcnjOE4JbLWePZ2c552/3soOrbZcZws17LB2E4mOXfXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794209137;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YHXccpFDMaLgpxwFRumTVl0AHaueUPNTlnLxC93XK3g=;
	b=u+9LDk3cTt3GR1rHVn6CJucqtfLfbpWA9CCdbrvFw6H93ZN7i10IK5QK/RNC9kBJtVLH
	 wChpURt3M9+R38E3ak31NVu8bZsGV8XsuzoX74pRS/ym5FxuulisKbkzfuvAFiSNPbRQ3
	 u4kZEH7rVFydomOOqjyNAS18WcnfQUcDwHltOO0i/rL25QDI2udsnI9TOU7RiK88GKFrH
	 gNQnwBSH8Z4MNRemMTf+GM3dENQzmW+S+F0RmAniBSiJbdGNMHFTHyDwO5Dlsego65VRK
	 LQkHON/pF6Bis/YA7yNVgu2b9dcf4LWtlyS78tt2jVjcuCBrXrHivUhPLLLaXI9BMXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="Mm/TQpG/";
	arc=none smtp.remote-ip=95.215.58.165
Received: from mta1.migadu.com (out-165.mta1.migadu.com [95.215.58.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36416606A322
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 07:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36416606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Mm/TQpG/
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YHXccpFDMaLgpxwFRumTVl0AHaueUPNTlnLxC93XK3g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794209134; v=1; x=1794813934;
 b=Mm/TQpG/mPPvbNXim/V+x0XsoNCGipNQ8wJHrXnHDC0VdlOREvwJHDd6lR9jBHwUeQdAwIV2
 M2QNu/iXcc78YBNlHJzjuPr2/8QKoUQcibwBcxlMOghAgE6HO+rgTrfziZ4gtvLH0BiEf3+Z5Nu
 EI9YZPl3XdzWmJMuh9Mhc6as=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 27019bf8a3881414;
	Mon, 09 Nov 2026 07:25:33 +0000
X-Mizu-Trace-ID: 27019bf8a3881414
X-Migadu-Flow: FLOW_OUT
Date: Mon, 09 Nov 2026 08:25:28 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Jie Feng <hjf3108@gmail.com>
CC: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v2_7/7=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?12a=2C_8821a=3A_respect_peer_A-MPDU_size_limits?=
In-Reply-To: <CABOQOSXFXW4bVmnKpE25U_q+ru2Y+NZQGPsBnhTVGuWH4WBkPw@mail.gmail.com>
References: <20261031070950.425176-1-hjf3108@gmail.com> <20261031070950.425176-8-hjf3108@gmail.com> <ada56d168f44385c12672eee9f4a750716e6de67@linux.dev> <CABOQOSXFXW4bVmnKpE25U_q+ru2Y+NZQGPsBnhTVGuWH4WBkPw@mail.gmail.com>
Message-ID: <6CC165AE-91C8-42B6-BF8F-3CE1D3528378@linux.dev>
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

On November 8, 2026 7:09:40 PM GMT+01:00, Jie Feng <hjf3108@gmail.com>
wrote:
>On Sat, 7 Nov 2026 at 00:35, Luka Gejak <luka.gejak@linux.dev> wrote:

>> This is the same as rtw8812a_set_ampdu_factor() apart from the limit.
>> Maybe a single rtw88xxa_set_ampdu_factor() that picks the limit by chip
>> id, like rtw88xxa_set_crystal_cap() in patch 5 does for the mask?
> I feel that this one would not deduplicate much code and defeats the
> point of a
> per chip set_ampdu_factor callback anyway.

Fair enough. It is only two lines, and a shared helper would need an
export and a chip id check on top, so keeping them separate is fine
with me.


Best regards,
Luka Gejak
