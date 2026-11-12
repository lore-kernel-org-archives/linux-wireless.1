Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794518936;
	b=Pbxb9TZ3et8Gh+usCJHGby0DU8tZrymZhZCv8rVEGetZwT+WsdWSzU/OTKRGomJVv2pt
	 kpopmgiz45KDFRV26hW6ELWERPvshnuZHg3BqhtFLMwf9I5xI0CUaqLE+GhFM/SDqnQ7y
	 zjNXnwVq7Q/U7UwYHjZNlhyt4KDXPxcbgEYUtZ6Q1zAOrP6VXhEor7Y9tUP6Cv3n+/pUI
	 DsGp4RaZx4eaBPnyFRJD6cWlfCVUplNjQBYv3z4gTKllQXXvZlp5fUs9iGCkWYEul/lSX
	 j4WmzzyQecIlypRHTVF9IooXUyW+cDBO1Q2g9RW6iD4sjOXj9yVarpV68Wrfja3aUVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518936;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pzlq5o6tDF2OByZqSgFIlv+mTgpxtocxWTJ+jzA91r0=;
	b=a0R7fkDDabL0dakJmO29zeWJVExEEjaAcxg2Ik8Dfwi6afDfpfkEFGX08dJhLCDGDiIE
	 PGPcu+VWEF85EH/ntHMkmAbXdm8W3hfQuRGTMbh5z/AJvZo7Pv/ZwW83glL5LcyqH8pC7
	 +3XXkvocAS3TI5LExLuOTtAC3rds4KM2JZC3qI98TKWsL/q+Qep6UEwDkIxxU/mh25LM5
	 723s1aGeptwrX3Bg4dENfznmOGGpx0yT5M9ZGOjCl7pmOe3z7DMyWTve79ykxn3sXocQ/
	 wTiVn/RUBqY6zyI5ZWxxAvhQ5N/8a3E3O2AnbhjJBbK34UYX8OG0UXlgxE6KIxxU6yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wpIBTzt+;
	arc=none smtp.remote-ip=91.218.175.158
Received: from mta0.migadu.com (out-158.mta0.migadu.com [91.218.175.158])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCB4606A323
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 21:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DCB4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wpIBTzt+
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pzlq5o6tDF2OByZqSgFIlv+mTgpxtocxWTJ+jzA91r0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794518932; v=1; x=1795123732;
 b=wpIBTzt+/agFJSMfi1Wl6b52GfMYBiiIVzafDOjtpBsXi+i7v2W+q2Ioj/P9N6700TVRIRhY
 37ZN8un4qdKzHKhDBl+exwhgwxKN/lutVj+qs7Cm6ImhyE2DB2SsF3XG6lX84PUMzM7O4Kbn26C
 v93Yax4dSza97aTKxDI+QPGI=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 831542d396af7fc5;
	Thu, 12 Nov 2026 21:28:52 +0000
X-Mizu-Trace-ID: 831542d396af7fc5
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 22:28:50 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Kalpesh Solanki <skalpesh942@gmail.com>, pkshih@realtek.com
CC: kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_1/3=5D_wifi=3A_rtw88=3A_clear_RTW?=
 =?US-ASCII?Q?=5FFLAG=5FRESTARTING_on_stop_and_start_failure?=
In-Reply-To: <20261112131401.236433-2-skalpesh942@gmail.com>
References: <20261112131401.236433-1-skalpesh942@gmail.com> <20261112131401.236433-2-skalpesh942@gmail.com>
Message-ID: <24B0555C-4ED8-4403-BBD1-0E82611F0BFE@linux.dev>
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

On November 12, 2026 2:13:59 PM GMT+01:00, Kalpesh Solanki
<skalpesh942@gmail.com> wrote:
>When mac80211 stops or suspends the device without WoWLAN,
>drv_reconfig_complete() is never invoked with
>IEEE80211_RECONFIG_TYPE_RESTART. If firmware recovery was in flight
>during this transition, RTW_FLAG_RESTARTING remains set permanently,
>blocking all subsequent firmware recoveries until the module is reloaded.
>
>Similarly, if rtw_core_start() fails during drv_start() in a recovery
>restart, local->started remains false. When mac80211 cleans up via
>cfg80211_shutdown_all_interfaces(), drv_stop() returns early without
>calling rtw_ops_stop(), leaving RTW_FLAG_RESTARTING set permanently on
>hardware that failed to recover.
>
>Clear RTW_FLAG_RESTARTING in rtw_ops_stop(), as well as in
>rtw_ops_start() when rtw_core_start() returns an error, ensuring the
>driver always exits the restarting state on error or teardown.
>
>Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
>Cc: stable@vger.kernel.org
>Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
>---

You seem to have missed it in v4 so please pick up this tag in v6.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
