Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=125.209.209.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792963;
	b=KvmFUQ4sNYNMtUGZrm9+javP7T6fLacIxh/wbcisfbv1lokyezzbCg6OKfBcL9LVW4yO
	 C4uaDriMNqsMHtadAEfd9oh+gUaEXfhCevzlsZbFfWHh7CY9i8sUQlYoWQIg7ZB77K8Gf
	 nZ5RCZTNxGsrEPSxiQFgocnSccSmheZrEowN75OqtxRS6wc7pbjW91Ad0RElf2vtFdrqu
	 OGoF6fFmA0kVA1UjyqMuUrNJ02tMJq83p5JYvi0+4xPfQmmSXHiYJCi6lVxasxLr9tUj4
	 hs0JhDALAJojwkfqx7bWeoF/LSA9ayvMw9ne4u+i1WG/+wFMLRcQj6TkEWa3dHY4LJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792963;
	h=DMARC-Filter:DKIM-Signature:X-Originating-IP:Received:DKIM-Signature:
	 X-Session-ID:X-Originating-IP:X-Works-Send-Opt:X-Works-Smtp-Source:
	 Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HH9KwZ4xlVWu+DEU8vcIQXT4NkC3IO+FUYtAOZP9KTk=;
	b=CoCOKehSS4urHeacR3jmt2VXelm5BUtBB4DFOSf+l73D7NbibXGse0VIFDDUNpZLa6W3
	 KSWbLLJsczZeED8pnyxI/4434CKIhrpBe9Z/PHI2wLlDLO/uTlQmv6gE1eq/7I3k2r/+l
	 c6qlD9YByscOzqCbNu2JBqfAykKBq45Sy50As/+nDhphCNjNdEwFv5crRObvEFUpwR0+R
	 U48J65rQQwSDT9fcXLQrUSYOEKnFd6GPeZDEBs6fhBFN9JrBLv6N/NW+3FCgs7xoyG/Nl
	 YeQqrlQ5ke/Qh0WX/211ASvAYFcZGXP4mCD9VylSo2omtLGbXYlmSpTD3gCp4RN5tCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=skku.edu;
	spf=pass smtp.mailfrom=skku.edu;
	dkim=pass header.d=worksmobile.com header.i=@worksmobile.com header.a=rsa-sha256 header.s=s20171120 header.b=XwoF7FxH;
	dkim=pass header.d=skku.edu header.i=@skku.edu header.a=rsa-sha256 header.s=naverworks header.b=EcY2Oopi;
	arc=none smtp.remote-ip=125.209.209.39
Received: from cvsmtppost101.wmail.worksmobile.com (cvsmtppost101.wmail.worksmobile.com [125.209.209.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F42606A321
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 15:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F42606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=skku.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skku.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=worksmobile.com header.i=@worksmobile.com header.a=rsa-sha256 header.s=s20171120 header.b=XwoF7FxH;
	dkim=pass (2048-bit key) header.d=skku.edu header.i=@skku.edu header.a=rsa-sha256 header.s=naverworks header.b=EcY2Oopi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
	s=s20171120; t=1795792956;
	bh=5Luthm/fBMMXB7tO03FBc1jPioKY9O3w7Xr0tjAIirc=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=XwoF7FxHmpklhnFD5oDVHIVxbuLXsSXl1wTjwBaLfokMv7sNwyAoiepFBWRuna7mU
	 SMkXNPcEdl/Gg4kFAGmd9cLaljLFSYg+3iMj1ZoOKQx7y/fFdOdNkiMJ1QymsITDLH
	 /foMs07MpBZnZgFFbTXonvH90vrPB2+kO4s+4eJVa4pLhounbn3X90jDVzAcHd3Cjt
	 wTEXGGtT9qI0m85VgXF5XlqulghX6YuHUhZwmBbvt7xQOl/XuDvGGWCQT7cyV8Ucn0
	 syUxu1bTe9ePe332pBkm9T4XQS6ONtW1sekAM6XGQABtlX1K0JZG7zTIcPMi2LOT3T
	 h244wv3kQPzQg==
Received: from kr1-hmac-real-2 ([10.174.201.129])
  by cvsmtppost101.wmail.worksmobile.com with ESMTP id NEwPXCclRo+O2nOGe6Zm2A
  for <linux-wireless@vger.kernel.org>;
  Fri, 27 Nov 2026 15:22:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=skku.edu; s=naverworks;
	t=1795792956; bh=5Luthm/fBMMXB7tO03FBc1jPioKY9O3w7Xr0tjAIirc=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=EcY2OopiS9H32AFBvQyi0Pdp0KqRfZTvL/Zy+i74tg7ShI2wDQqCZrkZWpJ62B9pW
	 xYSEOWyqGU+SkYZKxo/q6QDXRlKVQIqbuML4Jq2M83hW8dRSYGyGrjIVMKtq7muDMv
	 XD5cBZ2JeRHJAf47+2Ipcpz3ii3RkD8Zwi+Wxe1Dww+hgpofGwX1C13s7oXLy+FV7L
	 WL9oIvPLoU++6cMJd63prFNxG12Rez37g0q5YkA6Rb88jCycd/JmHY8s+m0q2xrC+F
	 04elG8YlrOJ/Y+LmzMO0lIQtaMAfuKiTK4UJOsc1+0p5qJy4A3JPyTUqPpirC6KVB5
	 kylF2jo0IP8jw==
X-Session-ID: ZAYgYhUaSHKGm9JxiZuTgw
X-Works-Send-Opt: w/KXFqgmKAKmKAFYKqMqKA2mFAurjAumKAgmKxEmKqK/aAtwaBmmjAFYKxM/axKmKo2rFBwYjAg=
X-Works-Smtp-Source: AqKrFqElFqJZ+HmrFxEm+6E=
Received: from d20be28ee783.tail196be.ts.net ([115.145.173.180])
  by cvnsmtp104.wmail.worksmobile.com with ESMTP id ZAYgYhUaSHKGm9JxiZuTgw
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Fri, 27 Nov 2026 15:22:36 -0000
From: Kyuwon Cho <kyuwon.cho@skku.edu>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Muna Sinada <muna.sinada@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless] wifi: mac80211: remove an AP_VLAN's stations before its links
Date: Sat, 28 Nov 2026 00:22:35 +0900
Message-ID: <179579257178.2074758.15817445529933771357@skku.edu>
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

ieee80211_do_stop() clears the links of an AP_VLAN before it flushes
the interface's stations. If a station of an AP MLD was moved to the
AP_VLAN, ieee80211_vif_update_links() still finds it while turning the
AP_VLAN into a non-MLD, removes it and warns:

  WARNING: net/mac80211/link.c:321 at ieee80211_vif_update_links+0x1915/0x2160
   ieee80211_vif_set_links (net/mac80211/link.c:473)
   ieee80211_do_stop (net/mac80211/iface.c:515)
   ieee80211_stop (net/mac80211/iface.c:871)
   __dev_close_many (net/core/dev.c:1838)
   netif_close_many (net/core/dev.c:1864)
   dev_close (net/core/dev_api.c:221)
   nl80211_del_interface (net/wireless/nl80211.c:5411)

Clear the AP_VLAN's links after its stations are gone.

Fixes: 90233b0ad215 ("wifi: mac80211: Create separate links for VLAN interfaces")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Kyuwon Cho <kyuwon.cho@skku.edu>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. A reproducer, which runs as any
user with mac80211_hwsim built in (an AP MLD on link 1, an AP_VLAN, a
station on link 1 moved to the AP_VLAN, then the AP_VLAN deleted):

#define _GNU_SOURCE
#include <linux/genetlink.h>
#include <linux/nl80211.h>
#include <net/if.h>
#include <sched.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <unistd.h>

static int nl;
static char buf[8192];
static const uint8_t sta[6] = { 0x02, 0x00, 0x00, 0x00, 0x99, 0x01 };

static void *put(char *msg, int type, const void *data, int len)
{
	struct nlmsghdr *h = (void *)msg;
	struct nlattr *a = (void *)(msg + NLMSG_ALIGN(h->nlmsg_len));

	a->nla_type = type;
	a->nla_len = NLA_HDRLEN + len;
	memcpy(a + 1, data, len);
	h->nlmsg_len = NLMSG_ALIGN(h->nlmsg_len) + NLA_ALIGN(a->nla_len);
	return a;
}

static void put32(char *msg, int type, uint32_t v) { put(msg, type, &v, 4); }

static char *req(int fam, int cmd)
{
	struct nlmsghdr *h = (void *)buf;
	struct genlmsghdr *g = NLMSG_DATA(h);

	memset(buf, 0, sizeof(buf));
	h->nlmsg_len = NLMSG_LENGTH(GENL_HDRLEN);
	h->nlmsg_type = fam;
	h->nlmsg_flags = NLM_F_REQUEST | NLM_F_ACK;
	g->cmd = cmd;
	return buf;
}

/* send and return the error of the ACK */
static int xact(char *msg)
{
	struct nlmsghdr *h = (void *)msg;
	int n;

	send(nl, msg, h->nlmsg_len, 0);
	while ((n = recv(nl, buf, sizeof(buf), 0)) > 0)
		for (h = (void *)buf; NLMSG_OK(h, n); h = NLMSG_NEXT(h, n))
			if (h->nlmsg_type == NLMSG_ERROR)
				return ((struct nlmsgerr *)NLMSG_DATA(h))->error;
	return -1;
}

static int family(const char *name)
{
	char *m = req(GENL_ID_CTRL, CTRL_CMD_GETFAMILY), reply[8192];
	struct nlmsghdr *h = (void *)buf;
	struct nlattr *a;
	int len;

	h->nlmsg_flags = NLM_F_REQUEST;
	put(m, CTRL_ATTR_FAMILY_NAME, name, strlen(name) + 1);
	send(nl, m, h->nlmsg_len, 0);
	len = recv(nl, reply, sizeof(reply), 0);
	h = (void *)reply;
	a = (void *)((char *)NLMSG_DATA(h) + GENL_HDRLEN);
	for (len = h->nlmsg_len - NLMSG_LENGTH(GENL_HDRLEN); len > 0;
	     len -= NLA_ALIGN(a->nla_len), a = (void *)((char *)a + NLA_ALIGN(a->nla_len)))
		if (a->nla_type == CTRL_ATTR_FAMILY_ID)
			return *(uint16_t *)(a + 1);
	return 0;
}

static void up(const char *ifname)
{
	struct ifreq ifr = { .ifr_flags = IFF_UP };
	int s = socket(AF_INET, SOCK_DGRAM, 0);

	strcpy(ifr.ifr_name, ifname);
	ioctl(s, SIOCSIFFLAGS, &ifr);
	close(s);
}

static int new_vlan(int nlf, int wlan0, const char *name, const uint8_t *mac)
{
	char *m = req(nlf, NL80211_CMD_NEW_INTERFACE);

	put32(m, NL80211_ATTR_IFINDEX, wlan0);
	put32(m, NL80211_ATTR_IFTYPE, NL80211_IFTYPE_AP_VLAN);
	put(m, NL80211_ATTR_IFNAME, name, strlen(name) + 1);
	put(m, NL80211_ATTR_MAC, mac, 6);
	return xact(m);
}

int main(void)
{
	const uint8_t l1[6] = { 0x02, 0xaa, 0, 0, 0, 0x01 };
	uint8_t head[] = { 0x80, 0, 0, 0, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
			   [10 ... 31] = 0, 100, 0, 1, 0,
			   0, 4, 'm', 'l', 'd', '1', 1, 1, 0x82, 3, 1, 6 };
	uint32_t f = 1 << NL80211_STA_FLAG_AUTHORIZED | 1 << NL80211_STA_FLAG_AUTHENTICATED |
		     1 << NL80211_STA_FLAG_ASSOCIATED;
	struct { uint32_t mask, set; } flags = { f, f };
	uint8_t rates[] = { 0x82, 0x84, 0x8b, 0x96 };
	struct ifreq ifr = { .ifr_name = "wlan0" };
	uint16_t v16 = 1, cap = 0x0401;
	uint8_t id = 1;
	int hw, nlf, wlan0, vl0, s;
	char *m;

	if (unshare(CLONE_NEWUSER | CLONE_NEWNET))
		return perror("unshare"), 1;
	nl = socket(AF_NETLINK, SOCK_RAW, NETLINK_GENERIC);
	hw = family("MAC80211_HWSIM");
	nlf = family("nl80211");
	m = req(hw, 4 /* HWSIM_CMD_NEW_RADIO */);
	put(m, 25 /* HWSIM_ATTR_MLO_SUPPORT */, NULL, 0);
	printf("NEW_RADIO (MLO): %d\n", xact(m));
	wlan0 = if_nametoindex("wlan0");
	s = socket(AF_INET, SOCK_DGRAM, 0);
	ioctl(s, SIOCGIFHWADDR, &ifr);
	m = req(nlf, NL80211_CMD_SET_INTERFACE);
	put32(m, NL80211_ATTR_IFINDEX, wlan0);
	put32(m, NL80211_ATTR_IFTYPE, NL80211_IFTYPE_AP);
	printf("wlan0 to AP: %d\n", xact(m));
	/* an AP MLD: add link 1 first, then start the AP on it */
	up("wlan0");
	m = req(nlf, NL80211_CMD_ADD_LINK);
	put32(m, NL80211_ATTR_IFINDEX, wlan0);
	put(m, NL80211_ATTR_MLO_LINK_ID, &id, 1);
	put(m, NL80211_ATTR_MAC, l1, 6);
	printf("ADD_LINK 1: %d\n", xact(m));
	memcpy(head + 10, l1, 6);
	memcpy(head + 16, l1, 6);
	m = req(nlf, NL80211_CMD_START_AP);
	put32(m, NL80211_ATTR_IFINDEX, wlan0);
	put(m, NL80211_ATTR_MLO_LINK_ID, &id, 1);
	put32(m, NL80211_ATTR_BEACON_INTERVAL, 100);
	put32(m, NL80211_ATTR_DTIM_PERIOD, 2);
	put(m, NL80211_ATTR_BEACON_HEAD, head, sizeof(head));
	put(m, NL80211_ATTR_SSID, "mld1", 4);
	put32(m, NL80211_ATTR_WIPHY_FREQ, 2437);
	printf("START_AP link 1: %d\n", xact(m));
	printf("vl0: %d\n", new_vlan(nlf, wlan0, "vl0", (uint8_t *)ifr.ifr_hwaddr.sa_data));
	up("vl0");
	vl0 = if_nametoindex("vl0");

	m = req(nlf, NL80211_CMD_NEW_STATION);
	put32(m, NL80211_ATTR_IFINDEX, wlan0);
	put(m, NL80211_ATTR_MAC, sta, 6);
	put(m, NL80211_ATTR_MLO_LINK_ID, &id, 1);
	put(m, NL80211_ATTR_STA_AID, &v16, 2);
	put(m, NL80211_ATTR_STA_LISTEN_INTERVAL, &v16, 2);
	put(m, NL80211_ATTR_STA_CAPABILITY, &cap, 2);
	put(m, NL80211_ATTR_STA_SUPPORTED_RATES, rates, sizeof(rates));
	put(m, NL80211_ATTR_STA_FLAGS2, &flags, sizeof(flags));
	printf("NEW_STATION on link 1: %d\n", xact(m));
	m = req(nlf, NL80211_CMD_SET_STATION);
	put32(m, NL80211_ATTR_IFINDEX, wlan0);
	put(m, NL80211_ATTR_MAC, sta, 6);
	put32(m, NL80211_ATTR_STA_VLAN, vl0);
	printf("SET_STATION to vl0: %d\n", xact(m));
	m = req(nlf, NL80211_CMD_DEL_INTERFACE);
	put32(m, NL80211_ATTR_IFINDEX, vl0);
	printf("DEL_INTERFACE vl0: %d\n", xact(m));
	return 0;
}

Without the patch, deleting the AP_VLAN warns as above; with it, it
does not.

Found and tested on mainline 9437ee8b6cf6 (v7.4-rc4-571); the patch is
against wireless (35c42b20ac87).

 net/mac80211/iface.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
index 588f26611a10..0e371f1908a3 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -543,9 +543,6 @@ static void ieee80211_do_stop(struct ieee80211_sub_if_data *sdata, bool going_do
 	case NL80211_IFTYPE_MONITOR:
 		list_del_rcu(&sdata->u.mntr.list);
 		break;
-	case NL80211_IFTYPE_AP_VLAN:
-		ieee80211_apvlan_link_clear(sdata);
-		break;
 	default:
 		break;
 	}
@@ -569,6 +566,9 @@ static void ieee80211_do_stop(struct ieee80211_sub_if_data *sdata, bool going_do
 		     sdata->vif.type != NL80211_IFTYPE_NAN &&
 		     sdata->vif.type != NL80211_IFTYPE_NAN_DATA && flushed > 0);
 
+	if (sdata->vif.type == NL80211_IFTYPE_AP_VLAN)
+		ieee80211_apvlan_link_clear(sdata);
+
 	/* don't count this interface for allmulti while it is down */
 	if (sdata->flags & IEEE80211_SDATA_ALLMULTI)
 		atomic_dec(&local->iff_allmultis);
-- 
2.43.0

