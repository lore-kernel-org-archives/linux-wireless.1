Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.60
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794550714;
	b=USRMtzN/DUiD4Q+VzSNwXHKljTaEAK7UEF5knTY1Jh7bLFtCmZiQEMz/bGMeoLHyvCja
	 W1gXkRJysEBm+KnEeVtiqS8a9WQtHPxq8gSWS6Ll+e9mLoP+3nV46J7O3UTzoogux7Xlf
	 3aFTH9us9cjxeUQ3gm7h5VvTsk7dCa4KAjvXDZyhs2MoapxGAoqh9ZJkNjnz9LCS7KDqz
	 y5BxlHhJdS+AcHAoLQ9tbHcpum1d2fMzDVKWS2mwwabJvQ2L+MJjqEGIxPg69z5VoH6PK
	 pqUhd4ENnKitaWS5qiyRC/9eJ/rPKQd7a+p9vPQUFEQ8XpN62kWI+fUD5t4bc70iJTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794550714;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8fhtiSM4RMXSPkWZ2Ym+TAinvYmR3dBhlVKb++Zid/U=;
	b=0OElgCUSt9vzhTPimauEDsU5NcyxSH/WHQpSFQ3K+UWRJIMOwoHiKXRcV9Md7cRDDwdL
	 /cJWcHzD+k1IX89OPuW1Q/Rm6A/rgi3ffTsCbxfGAWk1AylFGeS7F9Sbg1dFlLuIWeSjR
	 6dCIqj4Ejik7MAuEGmLPk3oPu53flQ9l8BRzNqPoFqXhzN2nZatNhRY6zqtN/IHG2a83h
	 y12DGIFGod1bqS9ufjmgFV+VUoF9CofEuaL24XXsKK4ukfr8fFp1wpH2Pma9mlFILpZNm
	 sepa6qGjS/hkn+5oBffU3j70owvWeblHCQ/rfnJyUYZiZjDasaIAGKO+0s0qKephq0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UPv0KjcG;
	arc=none smtp.remote-ip=91.218.175.60
Received: from mta0.migadu.com (out-60.mta0.migadu.com [91.218.175.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E606E606A327
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 06:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E606E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UPv0KjcG
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8fhtiSM4RMXSPkWZ2Ym+TAinvYmR3dBhlVKb++Zid/U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794550710; v=1; x=1795155510;
 b=UPv0KjcGCKw2FX6TaL4to0xlRFVjY0mChqj9N3zuAyzD7EB444b4uWLUSUZBiJ1RxWSIKkdk
 /wFJEVIL8/KsCMhYo8wWf7Z6XE4/FruiG145XXVd+nyj4FvsWrseMR5AF/1VTY3CSOEwgTJFc13
 ZS4+/Rz4n4DNcRgBHRB9NnF8=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3a5ec91a947c39f8;
	Fri, 13 Nov 2026 06:18:30 +0000
X-Mizu-Trace-ID: 3a5ec91a947c39f8
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 07:18:28 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Kalpesh Solanki <skalpesh942@gmail.com>, pkshih@realtek.com
CC: kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_2/3=5D_wifi=3A_rtw88=3A_skip_al?=
 =?US-ASCII?Q?ready_reset_station_in_rtw=5Fsta=5Fremove=28=29?=
In-Reply-To: <20261113034704.21283-3-skalpesh942@gmail.com>
References: <20261113034704.21283-1-skalpesh942@gmail.com> <20261113034704.21283-3-skalpesh942@gmail.com>
Message-ID: <5369FA8B-8D0E-490C-8CA4-7D572DF9276A@linux.dev>
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

On November 13, 2026 4:47:03 AM GMT+01:00, Kalpesh Solanki
<skalpesh942@gmail.com> wrote:
>During firmware recovery, __fw_recovery_work() iterates over all
>stations and invokes rtw_sta_remove() via rtw_reset_sta_iter().
>
>If recovery is triggered concurrently with station teardown (such as
>during ieee80211_set_disassoc() where mac80211 leaves LPS before
>removing the AP station), rtw_ops_sta_remove() is subsequently called
>for the same station. This causes rtw_sta_remove() to execute twice,
>leading to a double free of si->mask and an underflow of rtwdev->sta_cnt.
>
>Cancel pending rate control work first, as rtw_ops_sta_rc_update() can
>still schedule rc_work after the station was reset. Then check si->vif
>and return early if the station was already reset. Clear si->vif,
>si->mask, and si->use_cfg_mask upon removal to ensure clean teardown
>and avoid a NULL pointer dereference in rtw_rate_mask_cfg() if mac80211
>re-adds the station across recovery restart.
>
>Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
>Cc: stable@vger.kernel.org
>Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
>---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
